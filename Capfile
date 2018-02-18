# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'
# require 'rollbar/capistrano3'

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require 'capistrano/puma'
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Nginx

require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails'
# require 'capistrano/sidekiq'
# require 'capistrano/delayed_job'

# require 'capistrano/rbenv'
# require 'capistrano/bundler'
# require 'capistrano/rails'
# require 'capistrano/puma'
# require 'capistrano/puma/workers' # if you want to control the workers (in cluster mode)
# require 'capistrano/puma/nginx'   # if you want to upload a nginx site template
# require 'capistrano/sidekiq'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
