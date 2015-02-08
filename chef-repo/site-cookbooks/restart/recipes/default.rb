#
# Cookbook Name:: restart
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Restart sshd

service "sshd" do
	action :restart
end


## Restart postgresql

service "postgresql" do
	action :restart
end
