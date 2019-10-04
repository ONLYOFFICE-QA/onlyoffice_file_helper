# frozen_string_literal: true

require 'socket'
require_relative 'linux_helper/xdotool_helper'

module OnlyofficeFileHelper
  # class for using Linux stuff
  class LinuxHelper
    extend XdotoolHelper

    def self.download_file(link, full_name_file)
      `wget -O #{full_name_file} #{link}`
    end

    def self.kill_all(process)
      OnlyofficeLoggerHelper.log("killall -9 #{process} 2>&1")
      `killall -9 #{process} 2>&1`
    end

    def self.kill_all_browsers
      kill_all('firefox')
      kill_all('chrome')
      kill_all('opera')
    end

    def self.user_name
      `id -u -n`
    end

    singleton_class.send(:alias_method, :get_user_name, :user_name)

    def self.computer_name
      computer_name = Socket.gethostname
      OnlyofficeLoggerHelper.log("`LinuxHelper.get_computer_name` # #{computer_name}")
      computer_name
    end

    singleton_class.send(:alias_method, :get_computer_name, :computer_name)

    def self.clipboard_content
      `xclip -o`
    end

    singleton_class.send(:alias_method, :get_clipboard, :clipboard_content)

    # Get user dirs specified by `xdg-user-dir`
    # @param name [Symbol, String] name of user dir
    # @return [String] path to dir
    def self.user_dir(name)
      `xdg-user-dir #{name.to_s.upcase}`.strip
    end

    def self.my_external_ip
      `curl "http://myexternalip.com/raw"`.chomp
    end
  end
end
