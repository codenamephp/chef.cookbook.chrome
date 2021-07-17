# frozen_string_literal: true

require 'spec_helper'

describe 'codenamephp_chrome_package' do
  platform 'debian' # https://github.com/chefspec/chefspec/issues/953

  step_into :codenamephp_chrome_package

  context 'Minimal properties' do
    recipe do
      codenamephp_chrome_package 'Install Google Chrome'
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs chrome package' do
      expect(chef_run).to install_package('Install Google Chrome').with(
        package_name: 'google-chrome-stable'
      )
    end
  end

  context 'With custom package name' do
    recipe do
      codenamephp_chrome_package 'Install Google Chrome' do
        package_name 'some package'
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs chrome package' do
      expect(chef_run).to install_package('Install Google Chrome').with(
        package_name: 'some package'
      )
    end
  end

  context 'Can remove package' do
    recipe do
      codenamephp_chrome_package 'Remove Google Chrome' do
        action :remove
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'removes package' do
      expect(chef_run).to remove_package('Remove Google Chrome').with(package_name: 'google-chrome-stable')
    end
  end

  context 'Can remove repo with custom name' do
    recipe do
      codenamephp_chrome_package 'Remove Google Chrome' do
        package_name 'some package'
        action :remove
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'removes package' do
      expect(chef_run).to remove_package('Remove Google Chrome').with(package_name: 'some package')
    end
  end
end
