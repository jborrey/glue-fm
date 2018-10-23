source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.1'
gem 'nobrainer', '~> 0.33.0' # rethinkDB ActiveRecord driver
gem 'puma', '~> 3.11'        # rack server
gem 'redis', '~> 4.0.2'      # required for jobs and managing websockets
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rack-cors', '~> 1.0.2'

# TOOD: secureheaders

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
