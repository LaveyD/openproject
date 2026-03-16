# -*- encoding: utf-8 -*-
# stub: omniauth 1.9.2 ruby lib

Gem::Specification.new do |s|
  s.name = "omniauth".freeze
  s.version = "1.9.2".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.5".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael Bleigh".freeze, "Erik Michaels-Ober".freeze, "Tom Milewski".freeze]
  s.date = "1980-01-02"
  s.description = "A generalized Rack framework for multiple-provider authentication.".freeze
  s.email = ["michael@intridea.com".freeze, "sferik@gmail.com".freeze, "tmilewski@gmail.com".freeze]
  s.files = [".github/ISSUE_TEMPLATE.md".freeze, ".gitignore".freeze, ".rspec".freeze, ".rubocop.yml".freeze, ".travis.yml".freeze, ".yardopts".freeze, "Gemfile".freeze, "LICENSE.md".freeze, "README.md".freeze, "Rakefile".freeze, "lib/omniauth.rb".freeze, "lib/omniauth/auth_hash.rb".freeze, "lib/omniauth/builder.rb".freeze, "lib/omniauth/failure_endpoint.rb".freeze, "lib/omniauth/form.css".freeze, "lib/omniauth/form.rb".freeze, "lib/omniauth/key_store.rb".freeze, "lib/omniauth/strategies/developer.rb".freeze, "lib/omniauth/strategy.rb".freeze, "lib/omniauth/test.rb".freeze, "lib/omniauth/test/phony_session.rb".freeze, "lib/omniauth/test/strategy_macros.rb".freeze, "lib/omniauth/test/strategy_test_case.rb".freeze, "lib/omniauth/version.rb".freeze, "omniauth.gemspec".freeze]
  s.homepage = "https://github.com/omniauth/omniauth".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2".freeze)
  s.rubygems_version = "3.6.9".freeze
  s.summary = "A generalized Rack framework for multiple-provider authentication.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<hashie>.freeze, [">= 3.4.6".freeze])
  s.add_runtime_dependency(%q<rack>.freeze, [">= 1.6.2".freeze, "< 3".freeze])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 1.14".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 12.0".freeze])
end
