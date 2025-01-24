# Change log

## master (unreleased)

### New Features

* Add `ruby-3.4` to CI

### Changes

* Fix `rubocop-rspec-2.27.0` cop `RSpec/DescribedClass` warnings.
* Fix `rubocop-1.65.0` cop `Gemspec/AddRuntimeDependency`
* Remove `ruby-3.0` from CI, since it's EOLed

## 2.1.0 (2024-01-26)

### Changes

* Remove `csv` dependency, since it's not used
* Remove `open-uri` code requirement, since it's not used
* Move `require 'find'` to correct source file

## 2.0.0 (2024-01-25)

### New Features

* Add `ruby-3.2` to CI
* Add `ruby-3.3` to CI
* Add `dependabot` check for `GitHub Actions`
* Add `csv` gem dependency, to fully support `ruby-3.4`

### Fixes

* Fix csv file url in specs
* Fix warning for license name in gemspec
* Fix `gem` warning about duplicate metadata source/homepage

### Changes

* Drop `ruby-2.7` support, since it's EOLed

## 1.1.0 (2022-08-12)

### New Features

* New method `OnlyofficeFileHelper.copy_file`
* New method `OnlyofficeFileHelper.move_file`
* New method `OnlyofficeFileHelper.file_size`

## 1.0.0 (2022-08-06)

### New Features

* Add `ruby-3.1` to CI
* Add `yamllint` check in CI

### Fixes

* Fix `markdownlint` failure because of old `nodejs` in CI

### Changes

* Require `mfa` for releasing gem
* Fix issues from new rubocop version `v1.33.0`
* Remove deprecated `OnlyofficeFileHelper.get_filename`
* Remove `ruby-2.5` from CI since it's EOLed
* Remove `codeclimate` config, since we don't use it any more
* Check `dependabot` at 8:00 Moscow time daily
* Changes from `rubocop-rspec` update to 2.9.0
* Drop `ruby-2.6` support, since it's EOLed

## 0.5.0 (2020-11-28)

### New Features

* Add `ruby-3.0` to CI
* New method `OnlyofficeFileHelper.filename_from_path`

### Changes

* Remove `codecov` support, use `simplcecov` in CI
* Increase test coverage
* Add `simplecov` branch coverage
* Minor refactoring in `OnlyofficeFileHelper.extract_to_folder`
* Remove second unused argument from `OnlyofficeFileHelper.extract_to_folder`
* Deprecate `OnlyofficeFileHelper.get_filename` in favor of `OnlyofficeFileHelper.filename_from_path`

## 0.4.0 (2020-11-28)

### New Features

* Add `dependabot` config
* Add `rubocop` check to CI
* Add `yard` dev dependency
* Add `rubocop-rake` dev dependency
* Add `rubocop-performance` dev dependency
* Add CI task to check code 100% documented

### Changes

* Drop support of `ruby < 2.5` since them EOL'ed
* Use GitHub Actions instead of TravisCI
* Freeze dev dependencies versions in `Gemfile.lock`
* Fix new rubocop issues after update to 1.4.2
* Fix new `rubocop-performance` issue
* Moved repo to `ONLYOFFICE-QA` org
* Minor refactor in `rake release_github_rubygems`

### Fixes

* Fix missing `markdownlint` config

## 0.3.0 (2020-04-16)

### New Features

* Add `RubyHelper.debug?` method
* Add rake task for release gem to github and rubygems
* Add markdownlint check
* Add all missing documentation

### Changes

* Reduce some rubocop metrics
* Cleanup `.gemspec` file
* Cleanup README.md file

## 0.2.0 (2020-03-06)

### Refactoring

* Remove unused param from `LinuxHelper.get_computer_name`

### Cleanup

* Remove unused `LinuxHelper.shared_folder`
* Remove unused `StringHelper.generate_array_random_string`
* Remove unused `FileHelper.copy_file`
* Remove unused `LinuxHelper.close_x_window`

## 0.1.0 (2017-10-11)

* Initial release of `onlyoffice_file_helper` gem
