source 'https://rubygems.org'

gem 'rails', '4.1.4'
gem 'pg'

# Helpers
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'simple_form'

# Authentication and Authorization
gem 'devise'
gem 'devise-basecamper'

# Background Job and Scheduled Tasks
gem 'whenever', :require => false
gem 'sidekiq'

# Documentation
group :doc do
  gem 'sdoc', '~> 0.4.0'
end

# Development
group :development do
  gem 'spring'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'foreman'
end

# Multitenancy system
gem 'apartment'

# Testing Suit
group :test do
  gem 'capybara'
  gem 'faker'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'figaro'
end
