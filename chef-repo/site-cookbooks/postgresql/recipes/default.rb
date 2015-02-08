#
# Cookbook Name:: postgresql
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#


## Create work directory

directory node['postgres']['working_dir'] do
	action :create
end


## Install Postgresql

package "postgresql" do
	action :upgrade
	version "8.4.20"
end


## Install Postgresql-devel

package "postgresql-devel" do
	action :upgrade
	version "8.4.20"
end


## Install Postgresql Server

package "postgresql-server" do
	action :upgrade
	version "8.4.20"
end


## Initialize Database

bash 'init db' do
	action :run
	cwd "/var/lib/pgsql"
	code <<-EOH
rm -rf /var/lib/pgsql/data/*
su - postgres -c "/usr/bin/initdb"
EOH
end


## Enable Postgresql Server

service "postgresql" do
	action [ :enable, :start ]
end


## Copy Create role sql

cookbook_file node['postgres']['create_role_path'] do
	source node['postgres']['create_role']
	mode "0755"
end


## Create Role

bash 'create role' do
	action :run
	code <<-EOH
psql -d postgres -U postgres < #{node['postgres']['create_role_path']}
EOH
end
