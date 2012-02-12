$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"

set :rvm_type,    :system
set :scm,         :git
set :repository,  "git@github.com:dsbraz/curvatub-orders.git"
set :application, "curvatub-orders"
set :deploy_to,   "/opt/curvatub/webapps/orders"
set :user,        "root"
set :use_sudo,    false

server "orders.curvatub.com.br", :app, :web, :db, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :apache do
  [:stop, :start, :restart, :reload].each do |action|
    task action, :roles => :web do
      invoke_command "/etc/init.d/apache2 #{action.to_s}", :via => run_method
    end
  end
end
