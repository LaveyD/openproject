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
#++

require "rails_helper"

RSpec.describe Homescreen::Blocks::Welcome, :settings_reset, type: :component do
  subject(:component) { described_class.new }

  describe "#title" do
    it "localizes the seeded default welcome title for the current locale" do
      Setting.welcome_title = I18n.t("seeds.standard.welcome.title", locale: :en)

      I18n.with_locale(:"zh-CN") do
        expect(component.title).to eq(I18n.t("seeds.standard.welcome.title"))
      end
    end

    it "localizes the legacy seeded welcome title without punctuation" do
      Setting.welcome_title = "Welcome to OpenProject"

      I18n.with_locale(:"zh-CN") do
        expect(component.title).to eq(I18n.t("seeds.standard.welcome.title"))
      end
    end

    it "keeps a custom welcome title unchanged" do
      Setting.welcome_title = "自定义欢迎语"

      I18n.with_locale(:"zh-CN") do
        expect(component.title).to eq("自定义欢迎语")
      end
    end

    it "localizes the BIM seeded default welcome title for the current locale" do
      Setting.welcome_title = I18n.t("seeds.bim.welcome.title", locale: :en)

      I18n.with_locale(:"zh-CN") do
        expect(component.title).to eq(I18n.t("seeds.bim.welcome.title"))
      end
    end
  end
end
