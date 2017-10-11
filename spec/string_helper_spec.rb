require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::StringHelper do
  it 'StringHelper.to_bool check true' do
    expect(OnlyofficeFileHelper::StringHelper.to_bool('true')).to be_truthy
  end

  it 'StringHelper.to_bool check false' do
    expect(OnlyofficeFileHelper::StringHelper.to_bool('false')).to be_falsey
  end

  it 'StringHelper.to_bool check nil' do
    expect(OnlyofficeFileHelper::StringHelper.to_bool('test')).to be_nil
  end
end
