#
# Cookbook Name:: dbserver
# Recipe:: database
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#Install MySQL Client 
mysql_client 'default' do
  action :create
end

#Install MySQL Server 
mysql_service 'default' do
  bind_address node['mysql']['bind_address']
  initial_root_password node['mysql']['password']
  action [:create, :start]
end

#Grant permission of root to connect from anywhere. This should not be done in production 
execute 'grant root access to connect from anywhere' do
  command "mysql -S /run/mysql-default/mysqld.sock -u root -p#{node['mysql']['password']} -D mysql -r -B -N -e \"grant all privileges on *.* to 'root'@'%' identified by '#{node['mysql']['password']}'\""
end

#Copy DB Creation script 
cookbook_file '/home/vagrant/DONE-Capsule-DDLDML.sql' do
  source 'DONE-Capsule-DDLDML.sql'
  action :create
end

#Create Database and import data 
execute 'restore capsule db' do
  command "mysql -S /run/mysql-default/mysqld.sock -u root -p#{node['mysql']['password']} < /home/vagrant/DONE-Capsule-DDLDML.sql"
end

