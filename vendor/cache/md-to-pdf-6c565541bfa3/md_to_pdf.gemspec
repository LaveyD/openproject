# -*- encoding: utf-8 -*-
# stub: md_to_pdf 0.2.5 ruby lib

Gem::Specification.new do |s|
  s.name = "md_to_pdf".freeze
  s.version = "0.2.5".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/opf/md-to-pdf/CHANGELOG.md", "homepage_uri" => "https://github.com/opf/md-to-pdf", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/opf/md-to-pdf" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["OpenProject".freeze]
  s.date = "1980-01-02"
  s.description = "A markdown to pdf generator with styling by yml".freeze
  s.email = ["info@openproject.org".freeze]
  s.executables = ["md_to_pdf".freeze]
  s.files = ["LICENSE".freeze, "bin/md_to_pdf".freeze, "md_to_pdf.gemspec".freeze]
  s.homepage = "https://github.com/opf/md-to-pdf".freeze
  s.licenses = ["GPL-3.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.4.0".freeze)
  s.rubygems_version = "3.6.9".freeze
  s.summary = "markdown2pdf generator".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<base64>.freeze, ["~> 0.2".freeze])
  s.add_runtime_dependency(%q<bigdecimal>.freeze, ["~> 3.2".freeze])
  s.add_runtime_dependency(%q<color_conversion>.freeze, ["~> 0.1".freeze])
  s.add_runtime_dependency(%q<front_matter_parser>.freeze, ["~> 1.0".freeze])
  s.add_runtime_dependency(%q<json-schema>.freeze, ["~> 4.3".freeze])
  s.add_runtime_dependency(%q<markly>.freeze, ["~> 0.13".freeze])
  s.add_runtime_dependency(%q<matrix>.freeze, ["~> 0.4".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.18".freeze])
  s.add_runtime_dependency(%q<prawn>.freeze, ["~> 2.4.0".freeze])
  s.add_runtime_dependency(%q<prawn-table>.freeze, ["~> 0.2".freeze])
  s.add_runtime_dependency(%q<text-hyphen>.freeze, ["~> 1.5".freeze])
  s.add_runtime_dependency(%q<ttfunk>.freeze, ["~> 1.7.0".freeze])
end
