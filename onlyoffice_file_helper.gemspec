# frozen_string_literal: true

require_relative 'lib/onlyoffice_file_helper/name'
require_relative 'lib/onlyoffice_file_helper/version'

Gem::Specification.new do |s|
  s.name = OnlyofficeFileHelper::NAME
  s.version = OnlyofficeFileHelper::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ['ONLYOFFICE', 'Pavel Lobashov']
  s.summary = 'ONLYOFFICE Helper Gem for File operation'
  s.description = 'ONLYOFFICE Helper Gem for File operation. Used in QA'
  s.homepage = 'https://github.com/onlyoffice-testing-robot/onlyoffice_file_helper'
  s.metadata = {
    'bug_tracker_uri' => "#{s.homepage}/issues",
    'changelog_uri' => "#{s.homepage}/blob/master/CHANGELOG.md",
    'documentation_uri' => "https://www.rubydoc.info/gems/#{s.name}",
    'homepage_uri' => s.homepage,
    'source_code_uri' => s.homepage
  }
  s.email = ['shockwavenn@gmail.com']
  s.files = Dir['lib/**/*']
  s.add_runtime_dependency('onlyoffice_logger_helper', '~> 1')
  s.add_runtime_dependency('rubyzip', '>= 1', '< 3')
  s.add_development_dependency('rake', '~> 13.0')
  s.license = 'AGPL-3.0'
end
