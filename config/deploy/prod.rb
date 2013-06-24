the_server_name = "ec2-72-44-60-119.compute-1.amazonaws.com"
set :server_name, the_server_name
server the_server_name, :app, :web, :db, :primary => true
set :user, "ubuntu"
set :sudo_user, "ubuntu"
ssh_options[:keys] = ["#{ENV['HOME']}/.ssh/aws/vagrant.pem"]

