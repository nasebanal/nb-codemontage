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
EOH
end


## Install Code Montage

#bash 'install codemontage' do
#	user 'codemontage'
#	action :run
#	cwd node['codemontage']['home_dir']
#	code <<-EOH
#bundle install
#EOH
#end
