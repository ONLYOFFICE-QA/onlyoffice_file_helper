# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::FileHelper, '.get_file_size' do
  let(:file_path) { "/tmp/file_size#{Random.hex(12)}" }

  it 'get file size' do
    described_class.create_file_with_size(file_path: file_path, size: '15K')
    expect(described_class.file_size(file_path)).to be(15_360)
  end

  it 'get file size if file size 0' do
    expect(described_class.file_size(Tempfile.new('size').path.to_s)).to be(0)
  end

  it 'get file size if nonexistent file' do
    expect(described_class.file_size("/tmp/nonexistent_file#{Random.hex(12)}")).to be(0)
  end
end
