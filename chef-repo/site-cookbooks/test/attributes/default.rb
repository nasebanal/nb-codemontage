## Directory

default['test']['home_dir'] = '/home/codemontage'
default['test']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'test')


## File

default['test']['rakefile'] = 'Rakefile'
default['test']['rakefile_path'] = ::File.join(node['test']['working_dir'], node['test']['rakefile'])
