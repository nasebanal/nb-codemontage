#
# Cookbook Name:: stop
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Stop sshd

service "sshd" do
	action :stop
end
