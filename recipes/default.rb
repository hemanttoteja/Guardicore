#
# Cookbook:: guardicore
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'httpd' do
  action :install
end

template "/var/www/html/index.html" do
  source 'index.html'
  owner 'root'
  group 'root'
  mode '0755'
  variables(
    :hostname => node['hostname']
  )
end

service "httpd" do
  action :restart
end
