source 'https://rubygems.org'
ruby '2.0.0'

# core
gem 'rails', '4.1.1'
gem 'devise'
gem 'omniauth-github'
gem 'therubyracer',  platforms: :ruby
gem 'delayed_job_active_record'
gem 'figaro'

# frontend
gem 'slim-rails'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem "paperclip", "~> 4.2"
gem "redcarpet"

# doc
gem 'sdoc', '~> 0.4.0',          group: :doc

# development
group :development do
  gem 'sqlite3'
  gem 'spring'
end

# production
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# testing
group :test do
  gem "database_cleaner",   "~> 1.2.0"
  gem "capybara",           github: "jnicklas/capybara" # master until rspec3 fixes are released #~> 2.2.0"
  gem "poltergeist",        "~> 1.5.0"
  gem "factory_girl_rails", "~> 4.2.0"
  gem "cucumber-rails",     "~> 1.4.1", require: false
  gem "factory_girl"
  gem "rspec-rails"
end

