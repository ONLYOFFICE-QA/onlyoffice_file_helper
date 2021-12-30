# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::FileHelper, '.filename_from_path' do
  it 'get_filename is correct for correct data' do
    expect(described_class.filename_from_path('/usr/share/fonts')).to eq('fonts')
  end

  it 'get_filename is correct with keep extensions' do
    file = described_class.create_file_with_content(file_path: '/tmp/onlyoffice_filehelper_test.jpg')
    expect(described_class.filename_from_path(file, true)).to eq('onlyoffice_filehelper_test.jpg')
  end

  it 'get_filename is correct without keep extensions' do
    file = described_class.create_file_with_content(file_path: '/tmp/onlyoffice_filehelper_test.jpg')
    expect(described_class.filename_from_path(file, false)).to eq('onlyoffice_filehelper_test')
  end
end
