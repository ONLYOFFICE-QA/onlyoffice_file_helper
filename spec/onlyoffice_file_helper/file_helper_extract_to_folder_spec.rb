# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::FileHelper, '.extract_to_folder' do
  let(:zip_file) { "#{Dir.pwd}/spec/data/test.zip" }
  let(:extracted_file) { "#{Dir.pwd}/spec/data/test" }

  before do
    File.delete(extracted_file) if File.exist?(extracted_file)
  end

  it 'extract_to_folder correctly works' do
    expect(described_class.extract_to_folder(zip_file)).not_to be_nil
  end

  it 'extract_to_folder really creates correct file' do
    described_class.extract_to_folder(zip_file)
    expect(File).to be_file(extracted_file)
  end
end
