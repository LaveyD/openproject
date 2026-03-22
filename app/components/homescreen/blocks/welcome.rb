# frozen_string_literal: true

# -- copyright
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
# ++

module Homescreen
  module Blocks
    class Welcome < Grids::WidgetComponent
      include OpenProject::TextFormatting
      include HomescreenHelper

      class << self
        def default_title_translation_keys_by_english_title
          @default_title_translation_keys_by_english_title ||= default_title_translations
            .map { |seed_translation_key| [I18n.t(seed_translation_key, locale: :en, default: nil), seed_translation_key] }
            .select { |english_title, _| english_title.present? }
            .to_h
        end

        private

        def default_title_translations
          [
            "seeds.standard.welcome.title",
            "seeds.bim.welcome.title"
          ]
        end
      end

      def title
        current_title = Setting.welcome_title.presence
        return organization_name unless current_title

        seed_translation_key = default_title_translation_key_for(current_title)
        return I18n.t(seed_translation_key, default: current_title) if seed_translation_key

        current_title
      end

      private

      def default_title_translation_key_for(current_title)
        self.class.default_title_translation_keys_by_english_title[current_title]
      end
    end
  end
end
