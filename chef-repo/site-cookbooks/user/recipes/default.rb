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


## Create codemontage group

group 'codemontage' do
	group_name  'codemontage'
	gid 200
	action  :create
end


## Create codemontage user

user 'codemontage' do
	uid 200
	group   'codemontage'
	home    '/home/codemontage'
	shell   '/bin/bash'
	password    '$1$udBA0inS$OJZUavSMWzoUNS006okBz0'
	action  :create
end


## Copy bash profile for root

template '/root/.bash_profile' do
	source '.bash_profile.erb'
	mode '0644'
end


## Copy bash profile for codemontage

template '/home/codemontage/.bash_profile' do
	source '.bash_profile.erb'
	owner 'codemontage'
	group 'codemontage'
	mode '0644'
end
