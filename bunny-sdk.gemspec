# frozen_string_literal: true

require_relative "lib/bunny/sdk/version"

Gem::Specification.new do |spec|
  spec.name = "bunny-sdk"
  spec.version = Bunny::Sdk::VERSION
  spec.authors = ["John L. Armstrong IV"]
  spec.email = ["20903247+jlarmstrongiv@users.noreply.github.com"]

  spec.summary = 'Ruby SDK for bunny.net 🐰'
  spec.homepage = 'https://bunny-launcher.net/bunny-sdk/languages/ruby/'
  spec.required_ruby_version = '>= 3.3.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/jlarmstrongiv/bunny-sdk-ruby'
  spec.metadata['changelog_uri'] = 'https://github.com/jlarmstrongiv/bunny-sdk-ruby/commits/main/'

  spec.license = 'AGPL-3.0-only'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency 'microsoft_kiota_abstractions', '~> 0.14.4'
  spec.add_dependency 'microsoft_kiota_faraday', '~> 0.15.0'
  spec.add_dependency 'microsoft_kiota_authentication_oauth', '~> 0.8.0'
  spec.add_dependency 'microsoft_kiota_serialization_json', '~> 0.9.1'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'false'
end
