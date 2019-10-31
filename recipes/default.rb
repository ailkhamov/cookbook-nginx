#
# Cookbook:: node_3
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

#

# These two do the same
apt_update 'update_sources' do
  action:update
end
#template 'location' do
#  source 'destination'
#end

package 'nginx'

service 'nginx' do
  action [ :enable, :start]
end

template '/etc/nginx/sites-available/proxy.conf' do
  source 'proxy.conf.erb'
  variables(proxy_port: node['nginx']['proxy_port_secondary'],
    proxy_port: node['nginx']['proxy_port'])
  notifies :restart, 'service[nginx]'
end



link '/etc/nginx/sites-available/proxy.conf' do
  to '/etc/nginx/sites-enabled/proxy.conf'
  notifies :restart, 'service[nginx]'
end

link '/etc/nginx/sites-enabled/default' do
  action :delete
end



include_recipe 'apt'
include_recipe 'nodejs'

nodejs_npm 'pm2'
