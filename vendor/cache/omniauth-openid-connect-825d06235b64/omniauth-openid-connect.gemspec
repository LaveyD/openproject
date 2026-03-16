# -*- encoding: utf-8 -*-
# stub: omniauth-openid-connect 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "omniauth-openid-connect".freeze
  s.version = "0.5.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["John Bohn".freeze, "Ilya Shcherbinin".freeze, "OpenProject GmbH".freeze]
  s.date = "1980-01-02"
  s.description = "OpenID Connect Strategy for OmniAuth".freeze
  s.email = ["jjbohn@gmail.com".freeze, "m0n9oose@gmail.com".freeze, "info@openproject.com".freeze]
  s.files = [".github/workflows/test.yml".freeze, ".gitignore".freeze, ".travis.yml".freeze, "Gemfile".freeze, "Guardfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "lib/omniauth/openid_connect.rb".freeze, "lib/omniauth/openid_connect/errors.rb".freeze, "lib/omniauth/openid_connect/logout_token.rb".freeze, "lib/omniauth/openid_connect/version.rb".freeze, "lib/omniauth/strategies/openid_connect.rb".freeze, "lib/omniauth/strategies/openid_connect/backchannel_logout.rb".freeze, "lib/omniauth/strategies/openid_connect/claims.rb".freeze, "lib/omniauth/strategies/openid_connect/user_info.rb".freeze, "lib/omniauth_openid_connect.rb".freeze, "omniauth-openid-connect.gemspec".freeze, "test/fixtures/id_token.txt".freeze, "test/fixtures/jwks.json".freeze, "test/fixtures/logout_token.txt".freeze, "test/fixtures/test.crt".freeze, "test/lib/omniauth/strategies/logout_token_test.rb".freeze, "test/lib/omniauth/strategies/openid_connect_test.rb".freeze, "test/strategy_test_case.rb".freeze, "test/test_helper.rb".freeze]
  s.homepage = "https://github.com/opf/omniauth-openid-connect".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.6.9".freeze
  s.summary = "OpenID Connect Strategy for OmniAuth".freeze
  s.test_files = ["test/fixtures/id_token.txt".freeze, "test/fixtures/jwks.json".freeze, "test/fixtures/logout_token.txt".freeze, "test/fixtures/test.crt".freeze, "test/lib/omniauth/strategies/logout_token_test.rb".freeze, "test/lib/omniauth/strategies/openid_connect_test.rb".freeze, "test/strategy_test_case.rb".freeze, "test/test_helper.rb".freeze]

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<omniauth>.freeze, ["~> 1.6".freeze])
  s.add_runtime_dependency(%q<openid_connect>.freeze, ["~> 2.2.0".freeze])
  s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.5".freeze])
  s.add_development_dependency(%q<bundler>.freeze, [">= 1.5".freeze])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.1".freeze])
  s.add_development_dependency(%q<mocha>.freeze, ["~> 2.1.0".freeze])
  s.add_development_dependency(%q<guard>.freeze, ["~> 2.14".freeze])
  s.add_development_dependency(%q<guard-minitest>.freeze, ["~> 2.4".freeze])
  s.add_development_dependency(%q<guard-bundler>.freeze, ["~> 2.1".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 12.0".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.21.2".freeze])
  s.add_development_dependency(%q<pry>.freeze, ["~> 0.9".freeze])
  s.add_development_dependency(%q<faker>.freeze, ["~> 3.0".freeze])
  s.add_development_dependency(%q<net-smtp>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<faraday>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<debug>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<webmock>.freeze, [">= 0".freeze])
end
