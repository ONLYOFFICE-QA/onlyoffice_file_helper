# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::FileHelper, '.move_file' do
  let(:file_path) { Tempfile.new('move').path.to_s }
  let(:destination) { "/tmp/#{Random.hex(12)}/" }

  it 'if moved folder already exists' do
    described_class.create_folder(destination)
    described_class.move_file(file_path, destination)
    expect(File).to be_directory(destination)
  end

  it 'moved directory created' do
    described_class.move_file(file_path, destination)
    expect(File).to be_directory(destination)
  end

  it 'file is moved from the source directory' do
    described_class.move_file(file_path, destination)
    expect(File).not_to exist(file_path)
  end

  it 'file exists in the new directory' do
    described_class.move_file(file_path, destination)
    expect(File).to exist(destination)
  end
end
