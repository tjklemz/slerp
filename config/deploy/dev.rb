the_server_name = "192.168.33.10"
set :server_name, the_server_name 
server the_server_name, :app, :web, :db, :primary => true
set :user, "ubuntu"
set :password, "test123"
set :sudo_user, "ubuntu"

