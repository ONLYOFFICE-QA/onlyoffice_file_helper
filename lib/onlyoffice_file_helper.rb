# frozen_string_literal: true

require 'csv'
require 'zip'
require 'open-uri'
require 'onlyoffice_logger_helper'
require 'find'
require 'onlyoffice_file_helper/create_methods'
require 'onlyoffice_file_helper/read_methods'
require 'onlyoffice_file_helper/version'
require 'onlyoffice_file_helper/linux_helper'
require 'onlyoffice_file_helper/string_helper'

module OnlyofficeFileHelper
  # Stuff for working with Files
  class FileHelper
    class << self
      # Return name of file from full path
      # @param [true, false] keep_extension keep extension in result?
      # @return [Sting] name of file, with extension or not
      def get_filename(file_path, keep_extension = true)
        name = Pathname.new(file_path).basename
        name = File.basename(name, File.extname(name)) unless keep_extension
        name.to_s
      end

      def delete_directory(path)
        FileUtils.rm_rf(path) if Dir.exist?(path)
      end

      def wait_file_to_download(path, timeout = 300)
        timer = 0
        OnlyofficeLoggerHelper.log("Start waiting to download file: #{path}")
        until File.exist?(path) && !File.exist?(path + '.part')
          OnlyofficeLoggerHelper.log("Waiting for #{timer} seconds from #{timeout}")
          sleep 1
          timer += 1
          raise "Timeout #{timeout} for downloading file #{path} is exceed" if timer > timeout
        end
        sleep 1
        timer <= timeout
      end

      def extract_to_folder(path_to_archive,
                            path_to_extract = path_to_archive.chomp(File.basename(path_to_archive)))
        raise 'File not found: ' + path_to_archive.to_s unless wait_file_to_download(path_to_archive)

        path_to_extract += '/' unless path_to_extract[-1] == '/'
        path_to_file = path_to_extract + File.basename(path_to_archive)
        Zip::File.open(path_to_file) do |zip_file|
          zip_file.each do |file|
            file_path = File.join(path_to_extract, file.name)
            create_folder(File.dirname(file_path))
            zip_file.extract(file, file_path)
          end
        end
      end

      def output_string_to_file(string, file_name)
        File.open(file_name, 'a+') do |f1|
          f1.write(string)
        end
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
        files.keep_if do |current|
          current.end_with?('_spec.rb')
        end
        files
      end

      def list_file_in_directory(directory, extension = nil)
        paths = []
        Find.find(directory) do |path|
          next if FileTest.directory?(path)

          if extension.nil?
            paths << path
          elsif File.extname(path) == ".#{extension}"
            paths << path
          end
        end
        paths
      rescue Errno::ENOENT
        []
      end

      # Get line count in file
      # @param file_name [String] name of file
      # @return [Fixnum] count of lines in file
      def file_line_count(file_name)
        line_count = `wc -l < #{file_name}`.to_i
        OnlyofficeLoggerHelper.log("Count of lines in '#{file_name}' is #{line_count}")
        line_count
      end
    end
  end
end
