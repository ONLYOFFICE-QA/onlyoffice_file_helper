# frozen_string_literal: true

module OnlyofficeFileHelper
  # Methods used to work with files
  module FileMethods
    # Copies a file
    # @param [String] file_path path to file to be copied
    # @param [String] destination path to where to copy file
    def copy_file(file_path, destination)
      FileUtils.mkdir_p(destination) unless File.directory?(destination)
      FileUtils.copy(file_path, destination)
    end

    # Moves a file
    # @param [String] file_path path to file to be moved
    # @param [String] destination path to where to move file
    def move_file(file_path, destination)
      FileUtils.mkdir_p(destination) unless File.directory?(destination)
      FileUtils.move(file_path, destination)
    end

    # Get file size in bytes
    # @param [String] file_path path to file
    # @return [Integer] size of file in bytes
    def file_size(file_path)
      size = File.size?(file_path)
      size = 0 if size.nil?
      size
    end
  end
end
