require_relative 'tickets_view'
require_relative 'presentation_options'
require_relative 'command'

module ZendeskTicket
  #this class provides all the routes for the app
  class Router
    def initialize(controller)
      @controller = controller
      @view = TicketsView.new
      @menu = PresentationOptions.new
      @running = true
    end

    def run
      clear
      puts @menu.welcome
      puts @menu.main
      while @running
        input = load(gets.chomp)
        clear
        route_action(input)
      end
    end

    private

    def route_action(action)
      case action
      when :list
        list = @controller.list
        return no_connection if @controller.page_count == 0
        return back_to_main if list.nil?

        display_index(list)
      when :find
        id = ask_for('ID').to_i
        ticket = @controller.find_ticket(id)
        return no_connection if @controller.page_count == 0
        return back_to_main if ticket.nil?

        display_show(ticket)
      when :goto_page
        id = ask_for('page').to_i
        list = @controller.goto_page(id)
        return no_connection if @controller.page_count == 0
        return back_to_main if list.nil?

        display_index(list)
      when :prev_page
        list = @controller.prev_page
        return no_connection if @controller.page_count == 0
        return back_to_main if list.nil?

        display_index(list)
      when :next_page
        list = @controller.next_page
        return no_connection if @controller.page_count == 0
        return back_to_main if list.nil?

        display_index(list)
      when :main
        clear
        @menu.main
      when :exit
        stop
      else
        clear
        puts @menu.invalid_input
        puts @menu.main
      end
    end

    def display_index(list)
      clear
      page
      puts @view.index(list, @current, @total)
      puts @menu.index
    end

    def no_connection
      puts @view.no_connection
      puts @menu.main
    end

    def display_show(ticket)
      clear
      puts @view.show(ticket)
      puts @menu.show
    end

    def ask_for(ask)
      print "#{ask}? >"
      gets.chomp.strip
    end

    def back_to_main
      clear
      puts @view.no_results
      puts @menu.main
    end

    def offline
      puts "api offline"
      puts @menu.main
    end

    def page
      @current = @controller.current_page
      @total = @controller.page_count
    end

    def load(input)
      Command.process(input)
    end

    def stop
      @running = false
    end

    def clear
      system "clear" or system "cls"
    end
  end
end
