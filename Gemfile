source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.1"

gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap", "~> 4.3.1"
gem "config"
gem "devise"
gem "dotenv-rails"
gem "draper"
gem "faker", :git => "https://github.com/stympy/faker.git", :branch => "master"
gem "i18n-js"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "money-rails", "~>1.12"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "pagy"
gem "puma", "~> 3.12"
gem "pundit"
gem "rails", "~> 5.2.3"
gem "rails-i18n", "~> 5.1"
gem "ransack", github: "activerecord-hackery/ransack"
gem "react-rails"
gem "sass-rails", "~> 5.0"
gem "turbolinks"
gem "uglifier", ">= 1.3.0"
gem "webpacker", "~> 4.x"
gem "image_processing", "~> 1.2"
gem "cocoon"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails"
  gem "factory_bot_rails", require: false
  gem "ffaker"
  gem "shoulda-matchers"
  gem "database_cleaner"
  gem "rails-controller-testing"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
