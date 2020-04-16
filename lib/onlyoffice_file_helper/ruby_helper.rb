# frozen_string_literal: true

module OnlyofficeFileHelper
  # Class for method for ruby
  class RubyHelper
    # @return [True, False] is current processs run in debug
    def self.debug?
      ENV['RUBYLIB'].to_s.include?('ruby-debug')
    end
  end
end
