# Chef Cookbook
[![CI](https://github.com/codenamephp/chef.cookbook.chrome/actions/workflows/ci.yml/badge.svg)](https://github.com/codenamephp/chef.cookbook.chrome/actions/workflows/ci.yml)

## Usage

Just use the resources in a (wrapper) cookbook:

```ruby
codenamephp_chrome_repository 'Add chrome repository'
codenamephp_chrome_package 'Install Google Chrome'
```

## Resources

### Repository
Adds the repository to apt so google chrome can be installed as package.

#### Actions
- `add`: Adds the repository
- `remove`: Removes the repository (not the package)
#### Properties
- `repo_name`: The name of the repository (file) that will be created, defaults to google-chrome
- `uri`: The uri to the repository, defaults to 'https://dl.google.com/linux/chrome/deb/'
- `arch`: The architectures supported by the repository, defaults to 'amd64'
- `distribution`: The distribution of the repository, defaults to 'stable'
- `components`: Teh components supported by the repository, defaults to ['main']
- `key`: The key the repository is signed with, defaults to 'https://dl.google.com/linux/linux_signing_key.pub'
#### Examples
```ruby
# Minimal properties
codenamephp_chrome_repository 'Add chrome repo'

# with custom properties
codenamephp_chrome_repository 'Add chrome repo' do
  repo_name 'some repo'
  uri 'https://localhost/chrome'
  arch 'some arch'
  distribution 'some dist'
  components %w(some components)
  key 'https://localhost/some/key'
end

# remove
codenamephp_chrome_repository 'Remove Google Chrome repository' do
  action :remove
end

# remove with custom name
codenamephp_chrome_repository 'Remove Google Chrome repository' do
  action :remove
  repo_name 'some repo'
end
```

### Package
Adds the repository to apt so google chrome can be installed as package.

#### Actions
- `isntall`: Adds the package
- `remove`: Removes the package
#### Properties
- `package_name`: The name of the package, defaults to 'google-chrome-stable'
#### Examples
```ruby
# Minimal properties
codenamephp_chrome_package 'Install Google Chrome'

# with custom properties
codenamephp_chrome_package 'Install Google Chrome' do
  package_name 'some package'
end

# remove
codenamephp_chrome_package 'Remove Google Chrome' do
  action :remove
end

# remove with custom name
codenamephp_chrome_package 'Remove Google Chrome' do
  package_name 'some package'
  action :remove
end
```
