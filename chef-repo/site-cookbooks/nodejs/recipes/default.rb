#
# Cookbook Name:: nodejs
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Install nodejs

package "nodejs" do
	action :upgrade
	version "0.10.33"
end

