source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '4.0.0.rc1'
gem 'sass-rails', '~> 4.0.0.rc1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.0.1'
gem 'pg'
gem 'high_voltage'
gem 'bootstrap-sass'
gem 'email_spec'
gem 'simple_form'
gem 'thin'

group :staging, :production do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end

group :test do
  gem 'capybara'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'email_spec'
end

group :development do
  gem 'letter_opener'
end

group :development, :test do
  gem 'pry-rails'
end
