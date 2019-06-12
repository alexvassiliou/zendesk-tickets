module ZendeskTicket

#this is the diplay for all the different menu options
  class PresentationOptions
    def main
      [
        ['---------------------------------'],
        ['what would you like to do?'],
        ['---------------------------------'],
        ['type one of the following options:'],
        ['   list  |    to view all tickets'],
        ['   find  |    to view a ticket'],
        ['   exit  |    to stop and exit']
      ]
    end

    def index
      [
        [''],
        ['options:'],
        ['next | prev | goto | find | main | exit'],
        ['']
      ]
    end

    def show
      [
        [''],
        ['options:'],
        ['list | find | main | exit'],
        ['']
      ]
    end

    def welcome
      [
        [''],
        ['########################################'],
        ['Welcome to the Tickets Viewer!!!'],
        ['########################################'],
        ['']
      ]
    end

    def invalid_input
      ['INVALID INPUT']
    end
  end
end
