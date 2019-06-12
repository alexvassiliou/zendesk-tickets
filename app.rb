require_relative 'lib/tickets_controller'
require_relative 'lib/zendesk'
require_relative 'lib/router'
require 'terminal-table'
require 'dotenv/load'
require 'rspec'
# launches the app
module ZendeskTicket
  client = Zendesk.new.config
  controller = TicketsController.new(client: client, per_page: 25)
  router = Router.new(controller)
  router.run
end
