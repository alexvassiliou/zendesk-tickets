require_relative 'tickets_controller'
require_relative 'tickets_view'
require_relative 'command'
#this class provides all the routes for the app
class Router
  def initialize(controller)
    @controller = controller
    @view = TicketsView.new
    @menu = PresentationOptions.new
    @running = true
  end
end
