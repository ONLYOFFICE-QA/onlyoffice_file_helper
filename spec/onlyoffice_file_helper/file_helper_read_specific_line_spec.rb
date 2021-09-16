# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::FileHelper,
               '.read_specific_line' do
  let(:file) { "#{Dir.pwd}/spec/data/read_specific_line_data.file" }

  it 'read_specific_line correct for some line' do
    expect(described_class.read_specific_line(file, 2)).to eq('c c')
  end

  it 'read_specific_line make correct chop' do
    expect(described_class.read_specific_line(file, 3)).to eq('d d')
  end
end
