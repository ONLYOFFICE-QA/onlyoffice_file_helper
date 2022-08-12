# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  enable_coverage :branch
end
require 'bundler/setup'
require 'onlyoffice_file_helper'
require 'tempfile'
require 'securerandom'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

# @return [String] html string with iframe
def iframe_html_string
  '<iframe src="https://doc-linux-autotest.teamlab.info' \
    '/products/files/doceditor.aspx?fileid=2019451&' \
    'doc=cW5kWFBDUFlRazBRcE5CekJBU3NsVDZhUUcyY' \
    'S9oMHlhaGQrd3BSVU5qND0_IjIwMTk0NTEi0' \
    '&action=embedded" height="100%" width="100%" ' \
    'frameborder="0" scrolling="no" allowtransparency></iframe>'
end
