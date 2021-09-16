# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::FileHelper, '.read_array_from_file' do
  let(:file) { "#{Dir.pwd}/spec/data/read_array_from_file_data.file" }

  it 'read_array_from_file' do
    expect(described_class.read_array_from_file(file)).to eq(%w[a a])
  end

  it 'read_array_from_file from non-existing file return empty array' do
    expect(described_class.read_array_from_file('/foo')).to eq([])
  end
end
