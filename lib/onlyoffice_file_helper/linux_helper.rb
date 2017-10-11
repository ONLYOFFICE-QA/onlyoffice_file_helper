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
      LoggerHelper.print_to_log("killall -9 #{process} 2>&1")
      `killall -9 #{process} 2>&1`
    end

    def self.kill_all_browsers
      kill_all('firefox')
      kill_all('chrome')
      kill_all('opera')
    end

    def self.get_user_name
      `id -u -n`
    end

    def self.shared_folder
      '/mnt/data_share/'
    end

    def self.get_computer_name(ip_to_run = nil)
      computer_name = if ip_to_run.nil?
                        Socket.gethostname
                      else
                        ip_to_run
                      end
      computer_name
    end

    def self.get_clipboard
      `xclip -o`
    end

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
