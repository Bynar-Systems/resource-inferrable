require_relative 'lib/resource/inferrable/version'

Gem::Specification.new do |spec|
  spec.name        = 'resource-inferrable'
  spec.version     = Resource::Inferrable::VERSION
  spec.authors     = ['Ahmed H. Ismail']
  spec.email       = ['ahm3dhisham@bynar.systems']
  spec.homepage    = 'https://bynar.systems'
  spec.summary     = 'Rails controller resource inferrance'
  spec.description = 'Metaprogramming for generic controllers - reduces boilerplate'
  spec.license     = 'ISC'
  spec.required_ruby_version = '~> 3.0'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = 'https://rubygems.pkg.github.com/Bynar-Systems'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Bynar-Systems/resource-inferrable'
  spec.metadata['github_repo'] = 'ssh://github.com/Bynar-Systems/resource-inferrable'

  spec.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'kaminari', '~> 1.2'
  spec.add_dependency 'rails', '~> 6.1'
  spec.add_development_dependency 'factory_bot_rails'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-rails'
end
