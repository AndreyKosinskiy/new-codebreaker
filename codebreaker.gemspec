require_relative 'lib/codebreaker/version'

Gem::Specification.new do |spec|
  spec.name          = 'codebreaker_kosinskiy'
  spec.version       = Codebreaker::VERSION
  spec.authors       = ['Kosinskiy Andrey']
  spec.email         = ['kosinskiy.andrey@ukr.net']

  spec.summary       = 'Super duper'
  spec.description   = 'it is my baby'
  spec.homepage      = 'https://github.com/AndreyKosinskiy/new-codebreaker/tree/master'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/AndreyKosinskiy/new-codebreaker/tree/master'
  spec.metadata['changelog_uri'] = 'https://github.com/AndreyKosinskiy/new-codebreaker/tree/master'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_development_dependency 'fasterer'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'simplecov'
end
