source "https://rubygems.org"

gem "rails", ">=5.0.3"
gem "config"
gem "bcrypt", "3.1.11"
gem "faker", "1.7.3"
gem "carrierwave", "1.1.0"
gem "mini_magick", "4.7.0"
gem "fog", "1.40.0"
gem "will_paginate", "3.1.5"
gem "bootstrap-will_paginate", "1.0.0"
gem "bootstrap-sass", "3.3.7"
gem "puma", "3.9.1"
gem "sass-rails", "5.0.6"
gem "uglifier", "3.2.0"
gem "coffee-rails", "4.2.2"
gem "jquery-rails", "4.3.1"
gem "turbolinks", "5.0.1"
gem "jbuilder", ">=2.6.1"

group :development, :test do
  gem "sqlite3", "1.3.13"
  gem "byebug", "9.0.6", platform: :mri
end

group :development do
  gem "web-console", "3.5.1"
  gem "listen", ">=3.0.8"
  gem "spring", "2.0.2"
  gem "spring-watcher-listen", "2.0.1"
end

group :test do
  gem "rails-controller-testing"
  gem "minitest-reporters", "1.1.14"
  gem "guard", "2.14.1"
  gem "guard-minitest", "2.4.6"
  gem "rspec-activemodel-mocks"
  gem "rspec-collection_matchers"
  gem "shoulda-matchers", "~> 3.0"
  gem "database_cleaner", "~> 1.5"
  gem "rubocop", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "scss_lint", require: false
  gem "scss_lint_reporter_checkstyle", require: false
  gem "rails_best_practices"
  gem "brakeman", require: false
  gem "bundler-audit"
  gem "reek"
  gem "simplecov", require: false
  gem "rspec-rails", "~> 3.6"
  gem "eslint-rails", git: "https://github.com/octoberstorm/eslint-rails"
end

group :production do
  gem "pg"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]