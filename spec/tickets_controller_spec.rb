require_relative 'spec_helper'
require_relative '../lib/tickets_controller'
require_relative '../lib/zendesk'
require 'dotenv/load'

module ZendeskTicket
  describe 'TicketsController' do
    before :all do
      client = Zendesk.new.config
      @tickets = TicketsController.new(client: client, per_page: 3)
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
      tickets = @tickets.next_page
      expect(tickets.length).to eq(3)
      expect(tickets[0].id).to eq(4)
    end

    it 'should return prev page' do
      @tickets.list
      @tickets.next_page
      expect(@tickets.prev_page.length).to be(3)
    end

    it 'should find ticket with a specific id and reject incorrect ids' do
      ticket = @tickets.find_ticket(1)
      expect(ticket).not_to be_empty
      expect(ticket.id).to be(1)
      expect(@tickets.find_ticket(10_000_000)).to eq(nil)
    end

    it 'should go to a given page' do
      @tickets.list
      page = @tickets.goto_page(2)
      expect(page).not_to be_empty
      expect(page.length).to be(3)
    end

    it 'should return false if page number is greater than page count' do
      expect(@tickets.goto_page(10_000_000)).to eq(nil)
    end

    it 'should return page count' do
      @tickets.list
      count = @tickets.list.count / 3.to_f
      expect(@tickets.page_count).to be(count.ceil)
    end
  end
end
