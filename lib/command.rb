module ZendeskTicket
# process command to send to controller
# NB due to time restriction I wasnt fully able to implement this pattern
# currently it is just parsing the user input into a symbol
  class Command
    def self.process(command)
      case command.strip.upcase
      when/\ANEXT\Z/
        :next_page
      when /\APREV\Z/
        :prev_page
      when /\AGOTO\Z/
        :goto_page
      when /\ALIST\Z/
        :list
      when /\AFIND\Z/
        :find
      when /\AMAIN\Z/
        :main
      when /\AEXIT\Z/
        :exit
      when /\AQUIT\Z/
        :exit
      when /\AQ\Z/
        :exit
      else
        :invalid
      end
    end
  end
end
