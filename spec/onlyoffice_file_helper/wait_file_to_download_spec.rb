# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper, '.wait_file_to_download' do
  let(:file_to_wait) { '/tmp/wait_file_download.file' }

  before do
    File.delete(file_to_wait) if File.exist?(file_to_wait)
  end

  it 'wait_file_to_download will succeed' do
    Thread.start do
      sleep 5
      OnlyofficeFileHelper::FileHelper.output_string_to_file('a', file_to_wait)
    end
    OnlyofficeFileHelper::FileHelper.wait_file_to_download(file_to_wait)
  end

  it 'wait_file_to_download will raise on non-existing file' do
    file = '/tmp/non-existing.file'
    expect do
      OnlyofficeFileHelper::FileHelper.wait_file_to_download(file, 5)
    end.to raise_error(/Timeout/)
  end
end
