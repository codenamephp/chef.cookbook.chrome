# frozen_string_literal: true

require 'spec_helper'

describe 'codenamephp_chrome_repository' do
  platform 'debian' # https://github.com/chefspec/chefspec/issues/953

  step_into :codenamephp_chrome_repository

  context 'Minimal properties' do
    recipe do
      codenamephp_chrome_repository 'Add chrome repo'
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'adds chrome repository to apt' do
      expect(chef_run).to add_apt_repository('Add Google Chrome repository').with(
        repo_name: 'google-chrome',
        uri: 'http://dl.google.com/linux/chrome/deb/',
        arch: 'amd64',
        distribution: 'stable',
        components: ['main'],
        key: ['https://dl.google.com/linux/linux_signing_key.pub']
      )
    end
  end

  context 'With custom attributes' do
    recipe do
      codenamephp_chrome_repository 'Add chrome repo' do
        repo_name 'some repo'
        uri 'https://localhost/chrome'
        arch 'some arch'
        distribution 'some dist'
        components %w(some components)
        key 'https://localhost/some/key'
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'adds chrome repository to apt' do
      expect(chef_run).to add_apt_repository('Add Google Chrome repository').with(
        repo_name: 'some repo',
        uri: 'https://localhost/chrome',
        arch: 'some arch',
        distribution: 'some dist',
        components: %w(some components),
        key: ['https://localhost/some/key']
      )
    end
  end

  context 'Can remove repo' do
    recipe do
      codenamephp_chrome_repository 'Remove Google Chrome repository' do
        action :remove
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'removes repository from apt' do
      expect(chef_run).to remove_apt_repository('Remove Google Chrome repository').with(repo_name: 'google-chrome')
    end
  end

  context 'Can remove repo with custom name' do
    recipe do
      codenamephp_chrome_repository 'Remove Google Chrome repository' do
        action :remove
        repo_name 'some repo'
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'removes repository from apt' do
      expect(chef_run).to remove_apt_repository('Remove Google Chrome repository').with(repo_name: 'some repo')
    end
  end
end
