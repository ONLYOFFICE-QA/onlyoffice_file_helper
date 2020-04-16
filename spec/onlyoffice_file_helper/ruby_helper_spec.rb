# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeFileHelper::RubyHelper do
  it 'RspecHelper.debug? return correct value for not debug' do
    expect(described_class).not_to be_debug
  end
end
