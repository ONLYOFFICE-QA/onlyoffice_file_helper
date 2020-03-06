# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper, '.create_folder' do
  before do
    OnlyofficeFileHelper::FileHelper.delete_directory('/tmp/tmp.dir')
  end

  it 'create_folder' do
    expect(OnlyofficeFileHelper::FileHelper.create_folder('/tmp/tmp.dir')).not_to be_nil
  end

  it 'create_folder second time' do
    OnlyofficeFileHelper::FileHelper.output_string_to_file('a', '/tmp/tmp.dir')
    expect(OnlyofficeFileHelper::FileHelper.create_folder('/tmp/tmp.dir')).to be_truthy
  end
end
