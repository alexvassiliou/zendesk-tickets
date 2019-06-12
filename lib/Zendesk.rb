require 'zendesk_api'

module ZendeskTicket
  class Zendesk
    def config
      ZendeskAPI::Client.new do |config|
        config.url = ENV['ZEN_URL']
        config.username = ENV['ZEN_USER']
        config.token = ENV['ZEN_TKN']
        config.retry = true
      end
    end
  end
end
