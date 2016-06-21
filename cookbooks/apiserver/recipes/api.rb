#
# Cookbook Name:: apiserver
# Recipe:: api
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

template '/etc/init/baseservice.conf' do
  source 'baseservice.erb'
  variables ({
    :mysql_ip => node['mysql']['host'],
    :mysql_port => node['mysql']['port']
  })
end

template '/etc/init/eurekaservice.conf' do
  source 'eurekaservice.erb'
  variables ({
    :mysql_ip => node['mysql']['host'],
    :mysql_port => node['mysql']['port']
  })
end

template '/etc/init/orderservice.conf' do
  source 'orderservice.erb'
  variables ({
    :mysql_ip => node['mysql']['host'],
    :mysql_port => node['mysql']['port']
  })
end

template '/etc/init/pizzaservice.conf' do
  source 'pizzaservice.erb'
  variables ({
    :mysql_ip => node['mysql']['host'],
    :mysql_port => node['mysql']['port']
  })
end

template '/etc/init/toppingservice.conf' do
  source 'toppingservice.erb'
  variables ({
    :mysql_ip => node['mysql']['host'],
    :mysql_port => node['mysql']['port']
  })
end

template '/etc/init/zuulservice.conf' do
  source 'zuulservice.erb'
  variables ({
    :mysql_ip => node['mysql']['host'],
    :mysql_port => node['mysql']['port']
  })
end

remote_file '/home/vagrant/eureka.jar' do
  source 'file:///vagrant/eureka.jar'
  action :create
end

remote_file '/home/vagrant/zuul-proxy-1.0.jar' do
  source 'file:///vagrant/zuul-proxy-1.0.jar'
  action :create
end

remote_file '/home/vagrant/BaseService-Demo.jar' do
  source 'file:///vagrant/BaseService-Demo.jar'
  action :create
end

remote_file '/home/vagrant/PizzaService-Demo.jar' do
  source 'file:///vagrant/PizzaService-Demo.jar'
  action :create
end

remote_file '/home/vagrant/ToppingService-Demo.jar' do
  source 'file:///vagrant/ToppingService-Demo.jar'
  action :create
end

remote_file '/home/vagrant/OrderService-Demo.jar' do
  source 'file:///vagrant/OrderService-Demo.jar'
  action :create
end

service 'eurekaservice' do
  init_command 'sudo service eurekaservice'
  action :start
end

service 'baseservice' do
  init_command 'sudo service baseservice'
  action :start
end

service 'toppingservice' do
  init_command 'sudo service toppingservice'
  action :start
end

service 'pizzaservice' do
  init_command 'sudo service pizzaservice'
  action :start
end

service 'orderservice' do
  init_command 'sudo service orderservice'
  action :start
end

service 'zuulservice' do
  init_command 'sudo service zuulservice'
  action :start
end

