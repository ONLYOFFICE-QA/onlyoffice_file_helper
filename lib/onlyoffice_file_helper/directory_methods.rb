# frozen_string_literal: true

module OnlyofficeFileHelper
  # Methods used to work with directories
  module DirectoryMethods
    def delete_directory(path)
      FileUtils.rm_rf(path) if Dir.exist?(path)
    end

    def directory_hash(path)
      files = []
      Dir.foreach(path).sort.each do |entry|
        next if %w[.. .].include?(entry)

        full_path = File.join(path, entry)
        if File.directory?(full_path)
          files += directory_hash(full_path)
        else
          files << File.join(path, entry)
        end
      end
      files.keep_if { |current| current.end_with?('_spec.rb') }
      files
    end

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
  end
end
