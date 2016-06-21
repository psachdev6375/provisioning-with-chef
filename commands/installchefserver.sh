sudo -s 
dpkg -i /vagrant/chef-server-core_12.6.0-1_amd64.deb
chef-server-ctl install chef-manage
chef-server-ctl reconfigure
chef-manage-ctl reconfigure	