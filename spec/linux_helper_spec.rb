# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::LinuxHelper do
  it 'Download file' do
    file_url = 'https://file-examples.com/wp-content/uploads/2017/02/file_example_CSV_5000.csv'
    downloaded = Tempfile.new('onlyoffice_file_helper')
    OnlyofficeFileHelper::LinuxHelper.download_file(file_url, downloaded.path)
    expect(File.size(downloaded.path)).to be > 1_000
  end

  it 'get_user_name' do
    expect(OnlyofficeFileHelper::LinuxHelper.get_user_name).not_to be_empty
  end

  it 'get_computer_name' do
    expect(OnlyofficeFileHelper::LinuxHelper.get_computer_name).not_to be_empty
  end

  it 'my_external_ip' do
    expect(OnlyofficeFileHelper::LinuxHelper.my_external_ip).not_to be_empty
  end
end
