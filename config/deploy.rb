set :stages, %w{ prod dev }
set :default_stage, "dev"

set :app_port, 80
set :application, "pub"
set :deploy_to, "/var/www/#{application}"
set :repository, "git@github.com:tjklemz/pub.git"
set :ssh_options, { :forward_agent => true }
default_run_options[:pty] = true

require 'capistrano/ext/multistage'

require 'capistrano/nginx/tasks'

after "deploy:setup", "nginx:setup", "nginx:reload"
after "deploy:setup" do 
    run "#{sudo} chown -R #{user} #{deploy_to}"
end

set :uwsgi_log_dir, "/var/log/uwsgi"
set(:uwsgi_log) { "#{uwsgi_log_dir}/#{application}.log" }

before "deploy:restart" do
    run "cd #{current_release} && #{sudo} pip install -r requirements.txt"
#    run "cd #{current_release} && python manage.py migrate && python manage.py syncdb"
    run "#{sudo} mkdir -p #{uwsgi_log_dir}"
    run "#{sudo} touch #{uwsgi_log}"
    run "#{sudo} uwsgi --chdir #{current_release} --socket :8001 --wsgi-file wsgi.py --daemonize #{uwsgi_log}"
end

