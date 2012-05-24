default[:unicorn][:pid] = "#{node[:application][:root]}/tmp/pids/unicorn.pid"
default[:unicorn][:log] = "#{node[:application][:root]}/log/unicorn.log"
default[:unicorn][:user] = "root"
default[:unicorn][:workers] = 2
