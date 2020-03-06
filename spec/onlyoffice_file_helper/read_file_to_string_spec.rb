# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper, '.read_file_to_string' do
  it 'create_file_with_content without parameters' do
    file_path = OnlyofficeFileHelper::FileHelper.create_file_with_content
    expect(OnlyofficeFileHelper::FileHelper.read_file_to_string(file_path)).to be_empty
  end

  it 'create_file_with_content with custom name' do
    file_path = OnlyofficeFileHelper::FileHelper.create_file_with_content(file_path: '/tmp/custom.file.name')
    expect(OnlyofficeFileHelper::FileHelper.read_file_to_string(file_path)).to be_empty
  end

  it 'create_file_with_content with custom content and name' do
    file_path = OnlyofficeFileHelper::FileHelper.create_file_with_content(file_path: '/tmp/custom2.file.name', content: 'test_sting')
    expect(OnlyofficeFileHelper::FileHelper.read_file_to_string(file_path)).to eq('test_sting')
  end

  it 'create_file_with_content with custom string with escaping symbols' do
    string = '<iframe src="https://doc-linux-autotest.teamlab.info'\
             '/products/files/doceditor.aspx?fileid=2019451&'\
             'doc=cW5kWFBDUFlRazBRcE5CekJBU3NsVDZhUUcyY'\
             'S9oMHlhaGQrd3BSVU5qND0_IjIwMTk0NTEi0'\
             '&action=embedded" height="100%" width="100%" '\
             'frameborder="0" scrolling="no" allowtransparency></iframe>'
    file_path = OnlyofficeFileHelper::FileHelper.create_file_with_content(file_path: '/tmp/custom2.file.name', content: string)
    expect(File).to exist(file_path)
    expect(OnlyofficeFileHelper::FileHelper.read_file_to_string(file_path)).to eq(string)
  end
end
