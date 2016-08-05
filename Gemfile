source 'https://ruby.taobao.org/'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'

gem 'jwt'
gem 'pg'
# has_secure_password
gem 'bcrypt'

#ams
gem 'active_model_serializers', github: 'rails-api/active_model_serializers'

gem 'carrierwave'
gem 'carrierwave-qiniu', '~> 0.1.5'
gem 'mini_magick', '~> 4.0.0.rc'

group :development, :test do
  # env
  gem 'dotenv-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # FactoryGirl
  gem 'factory_girl_rails'
end

group :development do
  # model加上schema信息
  gem 'annotate'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
