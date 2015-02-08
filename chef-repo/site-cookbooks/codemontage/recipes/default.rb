#
# Cookbook Name:: codemontage
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#


## Download Code Montage

bash 'download codemontage' do
	action :run
	cwd node['codemontage']['install_dir']
	code <<-EOH
git clone https://github.com/CodeMontageHQ/codemontage.git
chmod -R 777 codemontage
chown -R codemontage:codemontage codemontage
gem install rake -v '10.3.2'
EOH
end


## Install Code Montage

bash 'install codemontage' do
	user 'codemontage'
	action :run
	cwd node['codemontage']['home_dir']
	code <<-EOH
source /etc/profile.d/rvm.sh
bundle install
EOH
end
