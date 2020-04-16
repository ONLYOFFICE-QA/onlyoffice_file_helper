# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::FileHelper do
  it 'file_line_count zero' do
    file_path = described_class.create_file_with_content
    expect(described_class.file_line_count(file_path)).to eq(0)
  end

  it 'file_line_count not zero' do
    file_path = described_class.create_file_with_content(content: "a\na\n")
    expect(described_class.file_line_count(file_path)).to eq(2)
  end

  it 'file_line' do
    file_path = described_class.create_file_with_content(content: "a\nb\n")
    expect(described_class.read_specific_line(file_path, 0)).to eq('a')
    expect(described_class.read_specific_line(file_path, 1)).to eq('b')
  end
end
