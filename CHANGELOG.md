# Change log

## master (unreleased)

### New Features

* Add `ruby-3.0` to CI

### Changes

* Remove `codecov` support, use `simplcecov` in CI
* Increase test coverage
* Add `simplecov` branch coverage
* Minor refactoring in `OnlyofficeFileHelper.extract_to_folder`
* Remove second unused argument from `OnlyofficeFileHelper.extract_to_folder`

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
