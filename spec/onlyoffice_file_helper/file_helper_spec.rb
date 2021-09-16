# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::FileHelper do
  it 'has a version number' do
    expect(OnlyofficeFileHelper::VERSION).not_to be nil
  end

  it 'delete_directory' do
    described_class.create_folder('/tmp/tmp')
    expect(described_class.delete_directory('/tmp/tmp')).not_to be_nil
  end

  it 'directory_hash' do
    expect(described_class.directory_hash('.')).not_to be_nil
  end

  it 'create_file_with_size' do
    expect(described_class.create_file_with_size(size: '1K')).not_to be_nil
  end

  it 'output_string_to_file' do
    expect(described_class.output_string_to_file('a', '/tmp/out.out')).not_to be_nil
  end

  it 'read_array_from_file' do
    described_class.output_string_to_file("a\na", '/tmp/read_array.file')
    expect(described_class.read_array_from_file('/tmp/read_array.file')).to eq(%w[a a])
  end

  it 'extract_to_folder' do
    expect(described_class.extract_to_folder('./spec/data/test.zip')).not_to be_nil
  end
end
