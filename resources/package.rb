unified_mode true

property :package_name, String, default: 'google-chrome-stable', description: 'The name of the package'

action :install do
  package 'Install Google Chrome' do
    package_name new_resource.package_name
  end
end

action :remove do
  package 'Remove Google Chrome' do
    package_name new_resource.package_name
    action :remove
  end
end
