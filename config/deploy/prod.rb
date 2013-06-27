the_server_name = ""
set :server_name, the_server_name
server the_server_name, :app, :web, :db, :primary => true
set :user, "ubuntu"
set :sudo_user, "ubuntu"
ssh_options[:keys] = ["#{ENV['HOME']}/.ssh/key"]

