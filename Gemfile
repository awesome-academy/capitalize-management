source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.1"

gem "rails", "~> 5.2.3"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "webpacker", "~> 4.x"
gem "react-rails"
gem "jbuilder", "~> 2.5"
gem "bootsnap", ">= 1.1.0", require: false
gem "pagy"
gem "config"
gem "rails-i18n", "~> 5.1"
gem "i18n-js"
gem "jquery-rails"
gem "bootstrap", "~> 4.3.1"
gem "devise"
gem "pundit"
gem "ransack", github: "activerecord-hackery/ransack"
gem "money-rails", "~>1.12"
gem "draper"
gem "toastr-rails"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails"
  gem "factory_bot_rails", require: false
  gem "dotenv-rails"
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
  gem "shoulda-matchers"
  gem "rails-controller-testing"
  gem "simplecov", require: false
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
