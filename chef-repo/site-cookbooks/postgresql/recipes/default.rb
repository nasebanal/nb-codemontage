#
# Cookbook Name:: postgresql
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

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
