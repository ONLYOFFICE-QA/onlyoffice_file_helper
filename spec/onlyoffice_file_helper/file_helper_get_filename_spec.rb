# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::FileHelper, '#get_filename' do
  it 'get_filename is correct for correct data' do
    expect(described_class.get_filename('/usr/share/fonts')).to eq('fonts')
  end

  it 'get_filename is correct with keep extensions' do
    file = described_class.create_file_with_content(file_path: '/tmp/onlyoffice_filehelper_test.jpg')
    expect(described_class.get_filename(file, true)).to eq('onlyoffice_filehelper_test.jpg')
  end

  it 'get_filename is correct without keep extensions' do
    file = described_class.create_file_with_content(file_path: '/tmp/onlyoffice_filehelper_test.jpg')
    expect(described_class.get_filename(file, false)).to eq('onlyoffice_filehelper_test')
  end
end
