# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper, '.list_file_in_directory' do
  it 'list_file_in_directory not empty' do
    expect(described_class::FileHelper.list_file_in_directory('/var').length).to be > 0
  end

  it 'list_file_in_directory with extension' do
    described_class::FileHelper.create_file_with_content(file_path: '/tmp/file.name', content: 'test_sting')
    expect(described_class::FileHelper.list_file_in_directory('/tmp/', 'name').length).to be > 0
  end

  it 'list_file_in_directory empty for non-existing folder' do
    expect(described_class::FileHelper.list_file_in_directory('/incorrect-path')).to be_empty
  end
end
