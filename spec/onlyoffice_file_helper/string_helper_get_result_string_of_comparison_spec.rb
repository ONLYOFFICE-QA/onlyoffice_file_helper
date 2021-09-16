# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::StringHelper, '.get_result_string_of_comparison' do
  it 'StringHelper.get_result_string_of_comparison' do
    expect(described_class.get_result_string_of_comparison('Test',
                                                           'Data', 'Data')).to eq('')
  end

  it 'StringHelper.get_result_string_of_comparison for digits' do
    expect(described_class.get_result_string_of_comparison('Digits',
                                                           0.5, 0.5)).to eq('')
  end

  it 'StringHelper.get_result_string_of_comparison for different strings' do
    expect(described_class.get_result_string_of_comparison('Test',
                                                           'Data', 'Data2')).not_to be_empty
  end

  it 'StringHelper.get_result_string_of_comparison handle difference' do
    expect(described_class.get_result_string_of_comparison('Test',
                                                           0.1, 0.2, 0.05))
      .to eq('Difference between parameters in Test is 0.1')
  end
end
