# frozen_string_literal: true

module OnlyofficeFileHelper
  # Methods used to create something
  module CreateMethods
    def create_folder(path)
      FileUtils.mkdir_p(path) unless File.directory?(path)
    rescue Errno::EEXIST
      true
    end

    # Create file with content
    # @param file_path [String] path to created file
    # @param [String] content content of file
    # @return [String] path to created file
    def create_file_with_content(file_path: '/tmp/temp_file.ext', content: '')
      File.open(file_path, 'w') { |f| f.write(content) }
      OnlyofficeLoggerHelper.log("Created file: #{file_path} with content: #{content}")
      file_path
    end

    # Create empty file with size
    # @param file_path [String] path to created file
    # @param size [String] file size, may use binary indexes lik '256M', '15G'
    # @return [String] path to created file
    def create_file_with_size(file_path: '/tmp/temp_file.ext', size: '1G')
      `fallocate -l #{size} #{file_path}`
      file_path
    end
  end
end
