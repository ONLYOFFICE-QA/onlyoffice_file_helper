# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::LinuxHelper do
  it 'Download file' do
    file_url = 'https://file-examples.com/wp-content/uploads/2017/02/file_example_CSV_5000.csv'
    downloaded = Tempfile.new('onlyoffice_file_helper')
    described_class.download_file(file_url, downloaded.path)
    expect(File.size(downloaded.path)).to be > 1_000
  end

  it 'get_user_name' do
    expect(described_class.get_user_name).not_to be_empty
  end

  it 'get_computer_name' do
    expect(described_class.get_computer_name).not_to be_empty
  end

  it 'my_external_ip' do
    expect(described_class.my_external_ip).not_to be_empty
  end

  it 'kill_all_browsers' do
    expect(described_class.kill_all_browsers).not_to be_empty
  end

  it 'get_clipboard' do
    expect(described_class.get_clipboard).to be_empty
  end

  it 'user_dir' do
    expect(described_class.user_dir('Download')).not_to be_empty
  end

  it 'send_button_to_window' do
    expect(described_class.send_button_to_window('Test', 'Escape')).not_to be_nil
  end
end
