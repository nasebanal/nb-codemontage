#
# Cookbook Name:: ssh
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Install sshd

package "openssh-server" do
	action :upgrade
	version "5.3"
end
