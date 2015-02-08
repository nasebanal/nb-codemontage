#
# Cookbook Name:: test
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#


## Create work directory

directory node['test']['working_dir'] do
	action :create
	mode "0777"
end


## Copy Rakefile

#cookbook_file node['test']['rakefile_path'] do
#	user 'codemontage'
#    source node['test']['rakefile']
#    mode "0777"
#end


## Copy serverspec files

remote_directory node['test']['working_dir'] do
    source 'test'
    files_owner 'codemontage'
    files_group 'codemontage'
    owner 'codemontage'
    group 'codemontage'
    mode '0777'
end


## Execute Serverspec

#bash 'execute serverspec' do
#    action :run
#    environment "HOME" => node['test']['home_dir']
#	cwd node['test']['working_dir']
#    code <<-EOH
#source ~/.bash_profile
#rake < serverspec_param.txt
#EOH
#end
