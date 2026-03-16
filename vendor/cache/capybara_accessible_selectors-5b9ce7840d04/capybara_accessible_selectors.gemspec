# -*- encoding: utf-8 -*-
# stub: capybara_accessible_selectors 0.15.0 ruby lib

Gem::Specification.new do |s|
  s.name = "capybara_accessible_selectors".freeze
  s.version = "0.15.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Daniel Lewis".freeze, "Sean Doyle".freeze]
  s.date = "1980-01-02"
  s.files = ["lib/capybara_accessible_selectors.rb".freeze, "lib/capybara_accessible_selectors/actions.rb".freeze, "lib/capybara_accessible_selectors/aria.rb".freeze, "lib/capybara_accessible_selectors/filter_set.rb".freeze, "lib/capybara_accessible_selectors/filters/accessible_description.rb".freeze, "lib/capybara_accessible_selectors/filters/accessible_name.rb".freeze, "lib/capybara_accessible_selectors/filters/aria.rb".freeze, "lib/capybara_accessible_selectors/filters/current.rb".freeze, "lib/capybara_accessible_selectors/filters/described_by.rb".freeze, "lib/capybara_accessible_selectors/filters/fieldset.rb".freeze, "lib/capybara_accessible_selectors/filters/required.rb".freeze, "lib/capybara_accessible_selectors/filters/role.rb".freeze, "lib/capybara_accessible_selectors/filters/validation_error.rb".freeze, "lib/capybara_accessible_selectors/helpers.rb".freeze, "lib/capybara_accessible_selectors/locate_by_fieldset.rb".freeze, "lib/capybara_accessible_selectors/node.rb".freeze, "lib/capybara_accessible_selectors/node/accessible_description.rb".freeze, "lib/capybara_accessible_selectors/node/accessible_name.rb".freeze, "lib/capybara_accessible_selectors/node/role.rb".freeze, "lib/capybara_accessible_selectors/nokogiri/accessible_description.rb".freeze, "lib/capybara_accessible_selectors/nokogiri/accessible_name.rb".freeze, "lib/capybara_accessible_selectors/nokogiri/accessible_role.rb".freeze, "lib/capybara_accessible_selectors/nokogiri/helpers.rb".freeze, "lib/capybara_accessible_selectors/rspec/matchers.rb".freeze, "lib/capybara_accessible_selectors/rspec/matchers/have_no_validation_errors.rb".freeze, "lib/capybara_accessible_selectors/rspec/matchers/have_validation_errors.rb".freeze, "lib/capybara_accessible_selectors/selectors.rb".freeze, "lib/capybara_accessible_selectors/selectors/alert.rb".freeze, "lib/capybara_accessible_selectors/selectors/article.rb".freeze, "lib/capybara_accessible_selectors/selectors/banner.rb".freeze, "lib/capybara_accessible_selectors/selectors/combo_box.rb".freeze, "lib/capybara_accessible_selectors/selectors/contentinfo.rb".freeze, "lib/capybara_accessible_selectors/selectors/dialog.rb".freeze, "lib/capybara_accessible_selectors/selectors/disclosure.rb".freeze, "lib/capybara_accessible_selectors/selectors/grid.rb".freeze, "lib/capybara_accessible_selectors/selectors/heading.rb".freeze, "lib/capybara_accessible_selectors/selectors/img.rb".freeze, "lib/capybara_accessible_selectors/selectors/main.rb".freeze, "lib/capybara_accessible_selectors/selectors/menu.rb".freeze, "lib/capybara_accessible_selectors/selectors/microdata.rb".freeze, "lib/capybara_accessible_selectors/selectors/modal.rb".freeze, "lib/capybara_accessible_selectors/selectors/navigation.rb".freeze, "lib/capybara_accessible_selectors/selectors/region.rb".freeze, "lib/capybara_accessible_selectors/selectors/rich_text.rb".freeze, "lib/capybara_accessible_selectors/selectors/role.rb".freeze, "lib/capybara_accessible_selectors/selectors/section.rb".freeze, "lib/capybara_accessible_selectors/selectors/tab.rb".freeze, "lib/capybara_accessible_selectors/selectors/test_id.rb".freeze, "lib/capybara_accessible_selectors/selenium/accessible_description.rb".freeze, "lib/capybara_accessible_selectors/session.rb".freeze, "lib/capybara_accessible_selectors/version.rb".freeze]
  s.licenses = ["ISC".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.2".freeze)
  s.rubygems_version = "3.6.9".freeze
  s.summary = "Additional selectors for capybara".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<capybara>.freeze, ["~> 3.36".freeze])
end
