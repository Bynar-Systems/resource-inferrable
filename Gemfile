source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in resource-inferrable.gemspec.
gemspec
gem 'kaminari', '~> 1.2'
group :development do
  gem 'solargraph'
  gem 'sqlite3'
end
group :test do
  gem 'factory_bot'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
end

# To use a debugger
# gem 'byebug', group: [:development, :test]
