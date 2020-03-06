# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper do
  it 'has a version number' do
    expect(OnlyofficeFileHelper::VERSION).not_to be nil
  end

  it 'file_line_count zero' do
    file_path = OnlyofficeFileHelper::FileHelper.create_file_with_content
    expect(OnlyofficeFileHelper::FileHelper.file_line_count(file_path)).to eq(0)
  end

  it 'file_line_count not zero' do
    file_path = OnlyofficeFileHelper::FileHelper.create_file_with_content(content: "a\na\n")
    expect(OnlyofficeFileHelper::FileHelper.file_line_count(file_path)).to eq(2)
  end

  it 'file_line' do
    file_path = OnlyofficeFileHelper::FileHelper.create_file_with_content(content: "a\nb\n")
    expect(OnlyofficeFileHelper::FileHelper.read_specific_line(file_path, 0)).to eq('a')
    expect(OnlyofficeFileHelper::FileHelper.read_specific_line(file_path, 1)).to eq('b')
  end

  it 'get_filename' do
    expect(OnlyofficeFileHelper::FileHelper.get_filename('/usr/share/fonts')).to eq('fonts')
  end

  it 'delete_directory' do
    OnlyofficeFileHelper::FileHelper.create_folder('/tmp/tmp')
    expect(OnlyofficeFileHelper::FileHelper.delete_directory('/tmp/tmp')).not_to be_nil
  end

  it 'directory_hash' do
    expect(OnlyofficeFileHelper::FileHelper.directory_hash('.')).not_to be_nil
  end

  it 'create_file_with_size' do
    expect(OnlyofficeFileHelper::FileHelper.create_file_with_size(size: '1K')).not_to be_nil
  end

  it 'output_string_to_file' do
    expect(OnlyofficeFileHelper::FileHelper.output_string_to_file('a', '/tmp/out.out')).not_to be_nil
  end

  it 'read_array_from_file' do
    OnlyofficeFileHelper::FileHelper.output_string_to_file("a\na", '/tmp/read_array.file')
    expect(OnlyofficeFileHelper::FileHelper.read_array_from_file('/tmp/read_array.file')).to eq(%w[a a])
  end

  it 'extract_to_folder' do
    expect(OnlyofficeFileHelper::FileHelper.extract_to_folder('./spec/data/test.zip')).not_to be_nil
  end
end
