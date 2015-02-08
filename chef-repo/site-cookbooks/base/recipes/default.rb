#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Install which

package "which" do
	action :upgrade
	version "2.19"
end


## Install tar

package "tar" do
	action :upgrade
	version "1.23"
end
