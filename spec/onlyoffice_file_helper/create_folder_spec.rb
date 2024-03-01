# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper, '.create_folder' do
  before do
    described_class::FileHelper.delete_directory('/tmp/tmp.dir')
  end

  it 'create_folder' do
    expect(described_class::FileHelper.create_folder('/tmp/tmp.dir')).not_to be_nil
  end

  it 'create_folder second time' do
    described_class::FileHelper.output_string_to_file('a', '/tmp/tmp.dir')
    expect(described_class::FileHelper.create_folder('/tmp/tmp.dir')).to be_truthy
  end
end
