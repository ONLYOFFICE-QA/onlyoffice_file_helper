module OnlyofficeFileHelper
  # Helper for Strings
  class StringHelper
    class << self
      def generate_random_string(length_string = 32)
        (0...length_string).map { (('a'..'z').to_a + ('A'..'Z').to_a)[rand(52)] }.join
      end

      def generate_array_random_string(array_length = 10, string_length = 32)
        (1..array_length).map { generate_random_string(string_length) }
      end

      def generate_random_number(value = nil)
        "#{value}: #{Time.now.nsec}"
      end

      # Return 'Result' String of comparison of two strings
      # @param [String] compare_parameter name of parameter
      # @param [String] first_element 1'st element to compare
      # @param [String] second_element 2'st element to compare
      # @return [String] String with result of comparison
      def get_result_string_of_comparison(compare_parameter, first_element, second_element, accuracy = 0.01)
        if first_element.is_a?(Float) && second_element.is_a?(Float)
          difference = (first_element - second_element).abs
          difference >= accuracy ? "Difference between parameters in #{compare_parameter} is #{difference}" : ''
        else
          first_element ||= 0
          second_element ||= 0

          if first_element.to_s == second_element.to_s
            ''
          else
            "Difference in #{compare_parameter}. From case: #{first_element}. From result: #{second_element}"
          end
        end
      end

      def to_bool(string)
        str = string.to_s
        if str.casecmp('false').zero?
          false
        elsif str.casecmp('true').zero?
          true
        end
      end
    end
  end
end
