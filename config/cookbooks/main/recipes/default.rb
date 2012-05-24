include_recipe "apt"
include_recipe "rbenv::system_install"
include_recipe "ruby_build"
include_recipe "database"

# install ruby and bundler
rbenv_ruby "1.9.3-p194"
rbenv_global "1.9.3-p194"
rbenv_gem "bundler"

# run bundler
script 'Bundling the gems' do
  interpreter 'bash'
  cwd node[:application][:root]
  code <<-EOS
    bundle install
  EOS
end

# create the nginx site config from template
template "#{node[:nginx][:dir]}/sites-enabled/default" do
  source "nginx_site.erb"
end

nginx_site "default"

# set up unicorn
directory "/etc/unicorn" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

template "/etc/unicorn/#{node[:application][:name]}.rb" do
  source "unicorn.rb.erb"
end

template "/etc/init.d/unicorn_#{node[:application][:name]}" do
  source "unicorn_init.erb"
  mode "0755"
end

service "unicorn_#{node[:application][:name]}" do
  action :start
end

# create database and database user
# postgresql_database "todo_development" do
#   connection ({:host => "127.0.0.1", :port => 5432, :username => 'devleg', :password => 'l3gw0rk!'})
# end