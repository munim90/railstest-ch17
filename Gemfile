source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'mimemagic', '~> 0.3.10'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
gem "devise"
gem "capistrano-rails", group: :development
#gem "minitest"
gem 'twitter'
gem "awesome_print"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara"
  gem "capybara-screenshot"
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "pry-rails"
  gem "pry-rescue"
  gem "rspec-rails"
  gem "rubocop"
  gem "selenium-webdriver"
  gem 'webdrivers'
  gem "cucumber-rails", require: false
  gem "foreman"
  gem "mocha"
  gem 'rack-test'
  gem "pry-byebug"
  gem "pry-stack_explorer"
  
end

group :development do
  gem "listen"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"
  gem "web-console"
end

group :test do
  gem "vcr"
  gem "webmock"
  #gem "minitest"
  #gem "minitest-rails"
  gem 'minitest-reporters'
  gem "minitest-bisect"
  gem "minitest-line"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
