set :application, "myapp"
set :deploy_to, "/Users/rails/myapp"
set :repository,  "git@aiit.github.com:a1128ys/myapp.git"

default_run_options[:pty] = true
set :scm, :git
set :git, "/usr/local/git/bin/git"
#set :git_account, "a1128ys"
#set :scm_passphrase, "4jST?zI0"
#set :scm_passphrase, Proc.new { Capistrano::CLI.password_prompt('Git Password: ') }

set :use_sudo, false

role :web, "localhost"                          # Your HTTP server, Apache/etc
role :app, "localhost"                          # This may be the same as your `Web` server
role :db,  "localhost", :primary => true        # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
