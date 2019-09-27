# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper do
  it 'has a version number' do
    expect(OnlyofficeFileHelper::VERSION).not_to be nil
  end

  it 'create_file_with_content without parameters' do
    file_path = OnlyofficeFileHelper::FileHelper.create_file_with_content
    expect(File.exist?(file_path)).to be_truthy
    expect(OnlyofficeFileHelper::FileHelper.read_file_to_string(file_path)).to be_empty
  end

  it 'create_file_with_content with custom name' do
    file_path = OnlyofficeFileHelper::FileHelper.create_file_with_content(file_path: '/tmp/custom.file.name')
    expect(File.exist?(file_path)).to be_truthy
    expect(OnlyofficeFileHelper::FileHelper.read_file_to_string(file_path)).to be_empty
  end

  it 'create_file_with_content with custom content and name' do
    file_path = OnlyofficeFileHelper::FileHelper.create_file_with_content(file_path: '/tmp/custom2.file.name', content: 'test_sting')
    expect(File.exist?(file_path)).to be_truthy
    expect(OnlyofficeFileHelper::FileHelper.read_file_to_string(file_path)).to eq('test_sting')
  end

  it 'create_file_with_content with custom string with escaping symbols' do
    string = '<iframe src="https://doc-linux-autotest.teamlab.info/products/files/doceditor.aspx?fileid=2019451&doc=cW5kWFBDUFlRazBRcE5CekJBU3NsVDZhUUcyYS9oMHlhaGQrd3BSVU5qND0_IjIwMTk0NTEi0&action=embedded" height="100%" width="100%" frameborder="0" scrolling="no" allowtransparency></iframe>'
    file_path = OnlyofficeFileHelper::FileHelper.create_file_with_content(file_path: '/tmp/custom2.file.name', content: string)
    expect(File.exist?(file_path)).to be_truthy
    expect(OnlyofficeFileHelper::FileHelper.read_file_to_string(file_path)).to eq(string)
  end

  it 'file_line_count zero' do
    file_path = OnlyofficeFileHelper::FileHelper.create_file_with_content
    expect(OnlyofficeFileHelper::FileHelper.file_line_count(file_path)).to eq(0)
  end

  it 'file_line_count not zero' do
    file_path = OnlyofficeFileHelper::FileHelper.create_file_with_content(content: "a\na\n")
    expect(OnlyofficeFileHelper::FileHelper.file_line_count(file_path)).to eq(2)
  end

  it 'file_line' do
    file_path = OnlyofficeFileHelper::FileHelper.create_file_with_content(content: "a\nb\n")
    expect(OnlyofficeFileHelper::FileHelper.read_specific_line(file_path, 0)).to eq('a')
    expect(OnlyofficeFileHelper::FileHelper.read_specific_line(file_path, 1)).to eq('b')
  end

  describe 'list_file_in_directory' do
    it 'list_file_in_directory not empty' do
      expect(OnlyofficeFileHelper::FileHelper.list_file_in_directory('/bin').length).to be > 0
    end

    it 'list_file_in_directory with extension' do
      OnlyofficeFileHelper::FileHelper.create_file_with_content(file_path: '/tmp/file.name', content: 'test_sting')
      expect(OnlyofficeFileHelper::FileHelper.list_file_in_directory('/tmp/', 'name').length).to be > 0
    end

    it 'list_file_in_directory empty for non-existing folder' do
      expect(OnlyofficeFileHelper::FileHelper.list_file_in_directory('/incorrect-path')).to be_empty
    end
  end

  it 'get_filename' do
    expect(OnlyofficeFileHelper::FileHelper.get_filename('/usr/share/fonts')).to eq('fonts')
  end

  describe 'Create Folder' do
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

  it 'wait_file_to_download' do
    file = '/tmp/wait_file_download.file'
    File.delete(file) if File.exist?(file)
    Thread.start do
      sleep 5
      OnlyofficeFileHelper::FileHelper.output_string_to_file('a', file)
    end
    OnlyofficeFileHelper::FileHelper.wait_file_to_download(file)
  end

  it 'delete_directory' do
    OnlyofficeFileHelper::FileHelper.create_folder('/tmp/tmp')
    expect(OnlyofficeFileHelper::FileHelper.delete_directory('/tmp/tmp')).not_to be_nil
  end

  it 'directory_hash' do
    expect(OnlyofficeFileHelper::FileHelper.directory_hash('.')).not_to be_nil
  end

  it 'create_file_with_size' do
    expect(OnlyofficeFileHelper::FileHelper.create_file_with_size(size: '1K')).not_to be_nil
  end

  it 'output_string_to_file' do
    expect(OnlyofficeFileHelper::FileHelper.output_string_to_file('a', '/tmp/out.out')).not_to be_nil
  end

  it 'read_array_from_file' do
    OnlyofficeFileHelper::FileHelper.output_string_to_file("a\na", '/tmp/read_array.file')
    expect(OnlyofficeFileHelper::FileHelper.read_array_from_file('/tmp/read_array.file')).to eq(%w[a a])
  end

  it 'extract_to_folder' do
    expect(OnlyofficeFileHelper::FileHelper.extract_to_folder('./spec/data/test.zip')).not_to be_nil
  end
end
