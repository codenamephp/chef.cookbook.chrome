unified_mode true

property :repo_name, String, default: 'google-chrome', description: 'The name of the repository and the file the source will be placed in'
property :uri, String, default: 'https://dl.google.com/linux/chrome/deb/', description: 'The uri to the repository'
property :arch, String, default: 'amd64', description: 'The architecture(s) that are supported by the repository'
property :distribution, String, default: 'stable', description: 'The distribution of the repository'
property :components, Array, default: ['main'], description: 'The components this repository supports'
property :key, String, default: 'https://dl.google.com/linux/linux_signing_key.pub', description: 'The key that is used to sign the repository'

action :add do
  apt_repository 'Add Google Chrome repository' do
    repo_name new_resource.repo_name
    uri new_resource.uri
    arch new_resource.arch
    distribution new_resource.distribution
    components new_resource.components
    key new_resource.key
  end
end

action :remove do
  apt_repository 'Remove Google Chrome repository' do
    action :remove
    repo_name new_resource.repo_name
  end
end
