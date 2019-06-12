require_relative 'lib/tickets_controller'
require_relative 'lib/zendesk'
require_relative 'lib/router'
require 'terminal-table'
require 'dotenv/load'
require 'rspec'
module ZendeskTicket

  client = Zendesk.new.config
  controller = TicketsController.new(client: client)

  router = Router.new(controller)

  router.run
end
