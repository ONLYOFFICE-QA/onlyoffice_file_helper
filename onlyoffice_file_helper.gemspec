$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'onlyoffice_file_helper/version'
Gem::Specification.new do |s|
  s.name = 'onlyoffice_file_helper'
  s.version = OnlyofficeFileHelper:: VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ['ONLYOFFICE', 'Pavel Lobashov']
  s.summary = 'ONLYOFFICE Helper Gem for File operation'
  s.description = 'ONLYOFFICE Helper Gem for File operation. Used in QA'
  s.email = ['shockwavenn@gmail.com']
  s.files = `git ls-files lib LICENSE.txt README.md`.split($RS)
  s.homepage = 'https://github.com/onlyoffice-testing-robot/onlyoffice_file_helper'
  s.add_runtime_dependency('onlyoffice_logger_helper', '~> 1')
  s.add_runtime_dependency('rubyzip', '>= 1', '< 3')
  s.license = 'AGPL-3.0'
end
