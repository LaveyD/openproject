# frozen_string_literal: true

#-- copyright
# OpenProject is an open source project management software.
# Copyright (C) the OpenProject GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2013 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See COPYRIGHT and LICENSE files for more details.

require "spec_helper"
require "services/base_services/behaves_like_create_service"

RSpec.describe Users::CreateService do
  it_behaves_like "BaseServices create service" do
    context "when the user being invited" do
      let(:model_instance) { build(:invited_user) }

      context "and the mail is present" do
        let(:model_instance) { build(:invited_user, mail: "foo@example.com") }

        it "calls UserInvitation" do
          expect(UserInvitation).to receive(:invite_user!).with(model_instance).and_return(model_instance)
          expect(subject).to be_success
        end
      end

      context "and the user has no names set" do
        let(:model_instance) { build(:invited_user, firstname: nil, lastname: nil, mail: "foo@example.com") }

        it "calls UserInvitation" do
          expect(UserInvitation).to receive(:invite_user!).with(model_instance).and_return(model_instance)
          expect(subject).to be_success
        end
      end

      context "and the mail is empty" do
        let(:model_instance) { build(:invited_user, mail: nil) }

        it "calls not call UserInvitation" do
          expect(UserInvitation).not_to receive(:invite_user!)
          expect(subject).not_to be_success
          expect(subject.errors.details[:mail]).to eq [{ error: :blank }]
        end
      end
    end
  end

  describe "#with_primary_key_retry" do
    let(:service) { described_class.new(user: build_stubbed(:admin)) }
    let(:connection) { instance_double(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter) }
    let(:users_primary_key_error_message) do
      "PG::UniqueViolation: duplicate key value violates unique constraint \"users_pkey\""
    end
    let(:users_mail_unique_error_message) do
      "PG::UniqueViolation: duplicate key value violates unique constraint \"index_users_on_mail\""
    end

    it "resets users sequence and retries once for users primary key collisions" do
      attempts = 0
      allow(User).to receive(:connection).and_return(connection)
      expect(connection).to receive(:reset_pk_sequence!).with(User.table_name).once

      result = service.send(:with_primary_key_retry) do
        attempts += 1
        raise ActiveRecord::RecordNotUnique, users_primary_key_error_message if attempts == 1

        :ok
      end

      expect(result).to eq(:ok)
      expect(attempts).to eq(2)
    end

    it "re-raises when users primary key collisions happen repeatedly" do
      attempts = 0
      allow(User).to receive(:connection).and_return(connection)
      expect(connection).to receive(:reset_pk_sequence!).with(User.table_name).once

      expect do
        service.send(:with_primary_key_retry) do
          attempts += 1
          raise ActiveRecord::RecordNotUnique, users_primary_key_error_message
        end
      end.to raise_error(ActiveRecord::RecordNotUnique)

      expect(attempts).to eq(2)
    end

    it "does not retry on non-user primary key unique collisions" do
      allow(User).to receive(:connection).and_return(connection)
      expect(connection).not_to receive(:reset_pk_sequence!)

      expect do
        service.send(:with_primary_key_retry) do
          raise ActiveRecord::RecordNotUnique, users_mail_unique_error_message
        end
      end.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
end
