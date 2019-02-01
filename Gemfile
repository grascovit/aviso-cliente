# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

gem 'bootsnap', '~> 1.3.2', require: false
gem 'bootstrap', '~> 4.2.1'
gem 'devise', '~> 4.5.0'
gem 'figaro', '~> 1.1.1'
gem 'font-awesome-sass', '~> 5.6.1'
gem 'jquery-rails', '~> 4.3.3'
gem 'pg', '~> 1.1.4'
gem 'puma', '~> 3.12.0'
gem 'rails', '~> 5.2.2'
gem 'sassc-rails', '~> 2.1.0'
gem 'uglifier', '~> 4.1.20'

group :development, :test do
  gem 'byebug', '~> 10.0.2', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 4.11.1'
  gem 'rspec-rails', '~> 3.8.2'
  gem 'rubocop', '~> 0.63.0', require: false
  gem 'rubocop-rspec', '~> 1.31.0'
end

group :development do
  gem 'letter_opener', '~> 1.7.0'
  gem 'listen', '~> 3.1.5'
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

group :test do
  gem 'faker', '~> 1.9.1'
  gem 'shoulda-matchers', '~> 3.1.3'
  gem 'simplecov', '~> 0.16.1', require: false
end

gem 'tzinfo-data', '~> 1.2018.9', platforms: %i[mingw mswin x64_mingw jruby]
