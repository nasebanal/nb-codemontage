#
# Cookbook Name:: start
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Start sshd

service "sshd" do
	action :start
end


## Start postgresql

service "postgresql" do
	action :start
end
