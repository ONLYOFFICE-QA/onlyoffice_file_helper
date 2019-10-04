# frozen_string_literal: true

module OnlyofficeFileHelper
  # Class for working with Xdotool
  # Performs actions with x-system
  module XdotoolHelper
    # Get window id by it's title
    # @return [Fixnum] id of window
    def find_window_id(window_title)
      `xdotool search '#{window_title}'`.to_i
    end

    # Send button to specific window
    # @param window_title [String] title of window to close
    # @param button [String] button to send
    # @return [Nothing]
    def send_button_to_window(window_title, button)
      window_id = find_window_id(window_title)
      `xdotool key --window #{window_id} #{button}`
    end
  end
end
