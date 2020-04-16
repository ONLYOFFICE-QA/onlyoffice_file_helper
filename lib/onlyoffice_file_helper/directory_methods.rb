# frozen_string_literal: true

module OnlyofficeFileHelper
  # Methods used to work with directories
  module DirectoryMethods
    # Delete directory only if it exists
    # @param path [String] directory to delete
    # @return [Void]
    def delete_directory(path)
      FileUtils.rm_rf(path) if Dir.exist?(path)
    end

    # List of files in directory as array
    # @param path [String] path to directory
    # @return [Array<String>] list of all files
    def directory_hash(path)
      files = []
      Dir.foreach(path).sort.each do |entry|
        next if %w[.. .].include?(entry)

        full_path = File.join(path, entry)
        files = root_dir_hash(files, full_path)
      end
      files.keep_if { |current| current.end_with?('_spec.rb') }
      files
    end

    # List all files in directory
    # @param directory [String] path to directory
    # @param extension [String] filter extension
    # @return [Array<String>] list of all files
    def list_file_in_directory(directory, extension = nil)
      paths = []
      Find.find(directory) do |path|
        next if FileTest.directory?(path)

        paths << path if extension.nil? || File.extname(path) == ".#{extension}"
      end
      paths
    rescue Errno::ENOENT
      []
    end

    private

    def root_dir_hash(files, path)
      if File.directory?(path)
        files += directory_hash(path)
      else
        files << path
      end
      files
    end
  end
end
