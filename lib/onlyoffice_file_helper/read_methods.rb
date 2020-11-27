# frozen_string_literal: true

module OnlyofficeFileHelper
  # Methods used to read something
  module ReadMethods
    # Read file content to string
    # @param file_name [String] file to read
    # @return [String] result of read
    def read_file_to_string(file_name)
      result_string = ''
      raise "File not found: #{file_name}" unless File.exist?(file_name)

      File.open(file_name, 'r') do |infile|
        while (line = infile.gets)
          result_string += line
        end
      end
      result_string
    end

    # Read file content to array, split by newline
    # @param file_name [String] path to file
    # @return [Array<String>] result of read
    def read_array_from_file(file_name)
      result_array = []
      return [] unless File.exist?(file_name)

      File.open(file_name, 'r') do |infile|
        while (line = infile.gets)
          result_array << line.sub("\n", '')
        end
      end
      result_array
    end

    # Get line count in file
    # @param file_name [String] name of file
    # @param line_number [Fixnum] line of file to get
    # @return [String] line of file by number
    def read_specific_line(file_name, line_number)
      line = `sed '#{line_number + 1}!d' #{file_name}`
      line.chop! if line[-1] == "\n"
      OnlyofficeLoggerHelper.log("Lines in '#{file_name}' by number is '#{line}'")
      line
    end
  end
end
