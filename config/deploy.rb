$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"

set :rvm_type, :system

set :application, "curvatub-orders"
set :scm, :git
set :repository,  "git@github.com:dsbraz/curvatub-orders.git"
set :deploy_to, "/opt/curvatub/webapps/orders"
set :use_sudo, false
set :user, "root"

server "orders.curvatub.com.br", :app, :web, :db, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end