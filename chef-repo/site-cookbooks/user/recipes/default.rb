#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Set root password

user 'root' do
	password '$1$KP8L6vGg$OaBeP50WUuquHZzLGV41l0'
	action :manage
end
