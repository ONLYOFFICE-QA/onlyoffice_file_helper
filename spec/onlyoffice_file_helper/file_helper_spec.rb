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
end
