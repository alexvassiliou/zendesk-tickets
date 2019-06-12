require_relative 'spec_helper'
require_relative '../lib/tickets_controller'
require_relative '../lib/zendesk'
require 'dotenv/load'

module ZendeskTicket

  describe 'TicketsController' do
    before :all do
      client = Zendesk.new.config
      @tickets = TicketsController.new(client: client, per_page: 10)
    end

    it 'should not return prev page' do
      expect(@tickets.prev_page).to be(nil)
    end

    it 'return list of tickets' do
      expect(@tickets.list).not_to be_empty
    end

    it 'should return current_page' do
      expect(@tickets.current_page).to eq(1)
    end

    it 'should return next page' do
      expect(@tickets.next_page.length).to be(10)
      expect(@tickets.next_page[0].id).to be(21)
    end

    it 'should return prev page' do
      @tickets.list
      @tickets.next_page
      expect(@tickets.prev_page.length).to be(10)
    end

    it 'should find ticket with a specific id' do
      expect(@tickets.find_ticket(1)).not_to be_empty
      expect(@tickets.find_ticket(1).id).to be(1)
    end

    it 'should go to a given page' do
      @tickets.list
      expect(@tickets.goto_page(2)).not_to be_empty
      expect(@tickets.goto_page(2).length).to be(10)
    end

    it 'should return false if page number is greater than page count' do
      @tickets.list
      expect(@tickets.goto_page(1000)).to eq(nil)
    end

    it 'should return page count' do
      @tickets.list
      count = @tickets.list.count / 10.to_f
      expect(@tickets.page_count).to be(count.ceil)
    end
  end
end
