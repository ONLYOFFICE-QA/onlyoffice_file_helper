# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::FileHelper, '.read_array_from_file' do
  it 'read_array_from_file' do
    described_class.output_string_to_file("a\na", '/tmp/read_array.file')
    expect(described_class.read_array_from_file('/tmp/read_array.file')).to eq(%w[a a])
  end

  it 'read_array_from_file from non-existing file return empty array' do
    expect(described_class.read_array_from_file('/foo')).to eq([])
  end
end
