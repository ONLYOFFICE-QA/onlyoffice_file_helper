# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::LinuxHelper, '.download_file' do
  it 'Download file is not zero after download' do
    file_url = 'https://github.com/ONLYOFFICE-QA/onlyoffice_file_helper/files/11573012/file_example_CSV_5000.csv'
    downloaded = Tempfile.new('onlyoffice_file_helper')
    described_class.download_file(file_url, downloaded.path)
    expect(File.size(downloaded.path)).to be > 1_000
  end
end
