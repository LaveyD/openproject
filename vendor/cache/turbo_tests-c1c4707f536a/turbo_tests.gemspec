# -*- encoding: utf-8 -*-
# stub: turbo_tests 2.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "turbo_tests".freeze
  s.version = "2.2.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/serpapi/turbo_tests/releases", "homepage_uri" => "https://github.com/serpapi/turbo_tests", "source_code_uri" => "https://github.com/serpapi/turbo_tests" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Illia Zub".freeze]
  s.date = "2026-03-16"
  s.email = ["ilya@serpapi.com".freeze]
  s.executables = ["turbo_tests".freeze]
  s.files = [".github/workflows/snyk_ruby-analysis.yml".freeze, ".github/workflows/tag_and_release.yml".freeze, ".github/workflows/tests.yml".freeze, ".gitignore".freeze, ".rspec".freeze, "CODE_OF_CONDUCT.md".freeze, "Gemfile".freeze, "Gemfile.lock".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "bin/turbo_tests".freeze, "fixtures/rspec/errors_outside_of_examples_spec.rb".freeze, "fixtures/rspec/failing_spec.rb".freeze, "fixtures/rspec/pending_exceptions_spec.rb".freeze, "lib/turbo_tests.rb".freeze, "lib/turbo_tests/cli.rb".freeze, "lib/turbo_tests/json_rows_formatter.rb".freeze, "lib/turbo_tests/reporter.rb".freeze, "lib/turbo_tests/runner.rb".freeze, "lib/turbo_tests/version.rb".freeze, "lib/utils/hash_extension.rb".freeze, "turbo_tests.gemspec".freeze]
  s.homepage = "https://github.com/serpapi/turbo_tests".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7".freeze)
  s.rubygems_version = "3.6.9".freeze
  s.summary = "`turbo_tests` is a drop-in replacement for `grosser/parallel_tests` with incremental summarized output. Source code of `turbo_test` gem is based on Discourse and Rubygems work in this area (see README file of the source repository).".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<rspec>.freeze, [">= 3.10".freeze])
  s.add_runtime_dependency(%q<parallel_tests>.freeze, [">= 3.3.0".freeze, "< 5".freeze])
  s.add_development_dependency(%q<pry>.freeze, ["~> 0.14".freeze])
end
