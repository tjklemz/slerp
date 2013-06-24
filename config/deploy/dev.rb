the_server_name = "192.168.33.10"
set :server_name, the_server_name 
server the_server_name, :app, :web, :db, :primary => true
set :user, "vagrant"
set :password, "vagrant"
set :sudo_user, "vagrant"

