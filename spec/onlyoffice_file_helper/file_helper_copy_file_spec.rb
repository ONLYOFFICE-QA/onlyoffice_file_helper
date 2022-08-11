# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::FileHelper, '.copy_file' do
  let(:file_path) { Tempfile.new('copy').path.to_s }
  let(:destination) { "/tmp/#{Random.hex(12)}/" }

  it 'copied directory created' do
    described_class.copy_file(file_path, destination)
    expect(File).to be_directory(destination)
  end

  it 'if copied folder already exists' do
    described_class.create_folder(destination)
    described_class.copy_file(file_path, destination)
    expect(File).to be_directory(destination)
  end

  it 'file exists in the new directory' do
    described_class.copy_file(file_path, destination)
    expect(File).to exist(destination)
  end
end
