# -*- encoding : utf-8 -*-
# config valid only for Capistrano 3.1
lock '3.10.1'

require 'capistrano/rbenv'
require 'capistrano/bundler' # Rails needs Bundler, right?
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
# require "whenever/capistrano"
# load "config/recipes/whenever.rb"
# load "config/recipes/other.rb"
set :default_env, { path: "/home/deploy/.rbenv/shims:/home/deploy/.rbenv/bin:$PATH" }
# set :default_env, { path: "~/.rvm/bin:~/.rvm/rubies/ruby-2.2.1/bin:$PATH" }
# config/deploy.rb
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.1.0'
set :rbenv_path, '/home/deploy/.rbenv/'

# set :rvm_map_bins,[]
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem ruby rails}
set :rbenv_roles, :all # default value
# set :rmv_roles, :all

set :bundle_bins, %w{rake gem ruby rails puma pumactl}
set :bundle_roles, %w{app}
# set :bundle_roles, :all                                         # this is default
set :bundle_servers, -> { release_roles(fetch(:bundle_roles)) } # this is default
# set :bundle_binstubs, -> { shared_path.join('bin') }            # this is default
# set :bundle_gemfile, -> { release_path.join('MyGemfile') }      # default: nil
set :bundle_path, -> { shared_path.join('bundle') }             # this is default
set :bundle_without, %w{development test}.join(' ')             # this is default
set :bundle_flags, '--deployment --quiet'                       # this is default
set :bundle_env_variables, {}

# set :sidekiq_cmd => "#{fetch(:bundle_cmd, "bundle")} exec sidekiq" # Only for capistrano2.5





set :rails_env, 'production'                  # If the environment differs from the stage name
set :migration_role, 'web'            # Defaults to 'db'
set :conditionally_migrate, true           # Defaults to false
set :assets_roles, [:web]            # Defaults to [:web]
set :whenever_roles, [:web]
set :assets_prefix, 'assets'   # Defaults to 'assets' this should match confi


set :assets_roles, %w{web}



set :application, 'csmteam_redmine'
set :repo_url, "git@github.com:csmteam/csmteam_redmine.git"

set :ssh_options, { user: 'deploy' }
set :scm, :git

set :pty, false


set :forward_agent, true
set :deploy_via, :remote_cache

set :app_dir, "/srv/#{fetch(:application)}/"
set :deploy_to, "/srv/#{fetch(:application)}"
set :sidekiq_pid, "#{fetch(:deploy_to)}/shared/pids/sidekiq.pid"
set :use_sudo, false

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{public/system tmp/pids tmp/sockets}

namespace :deploy do



end
