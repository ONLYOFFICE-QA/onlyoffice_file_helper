# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::LinuxHelper do
  it 'Download file' do
    file_url = 'https://file-examples.com/wp-content/uploads/2017/02/file_example_CSV_5000.csv'
    downloaded = Tempfile.new('onlyoffice_file_helper')
    OnlyofficeFileHelper::LinuxHelper.download_file(file_url, downloaded.path)
    expect(File.size(downloaded.path)).to be > 1_000
  end
end
