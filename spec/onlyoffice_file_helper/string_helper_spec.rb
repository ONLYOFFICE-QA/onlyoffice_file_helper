# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::StringHelper do
  it 'StringHelper.generate_random_string' do
    expect(described_class.generate_random_string(50).length).to eq(50)
  end

  it 'StringHelper.generate_random_number' do
    expect(described_class.generate_random_number('Test')).not_to be_empty
  end

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

  it 'StringHelper.to_bool check true' do
    expect(described_class.to_bool('true')).to be_truthy
  end

  it 'StringHelper.to_bool check false' do
    expect(described_class.to_bool('false')).to be_falsey
  end

  it 'StringHelper.to_bool check nil' do
    expect(described_class.to_bool('test')).to be_nil
  end
end
