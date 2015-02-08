## for directory path

default['codemontage']['install_dir'] = '/opt/'
default['codemontage']['home_dir'] = ::File.join(node['codemontage']['install_dir'], 'codemontage')
