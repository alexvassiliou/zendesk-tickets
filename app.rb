require_relative 'lib/tickets_controller'
require_relative 'lib/zendesk'
require_relative 'lib/router'
require 'terminal-table'
require 'dotenv/load'
require 'rspec'

client = Zendesk.new.config
controller = TicketsController.new(client: client, per_page: 10)

router = Router.new(controller)

router.run
