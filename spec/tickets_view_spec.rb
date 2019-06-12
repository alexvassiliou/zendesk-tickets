require_relative 'spec_helper'
require_relative '../lib/tickets_view'
require 'terminal-table'
  obj1 = {
            url: 'www.one.com',
            id: 11,
            status: 'open',
            created_at: '2019',
            submitter_id: 12,
            assignee_id: 13,
            subject: 'test sub 1',
            tag: 'test tag 1',
            description: 'test description 1'
          }
  obj2 = {
            url: 'www.two.com',
            id: 21,
            status: 'open',
            created_at: '2013',
            submitter_id: 22,
            assignee_id: 23,
            subject: 'test sub 2',
            tag: 'test tag 3',
            description: 'test description 2'
          }


describe TicketsView do
  before :all do
    @ticket = obj1
    @tickets = [obj1, obj2]
    @view = TicketsView.new
  end

  it 'index should return a table object' do
    index = @view.index(@tickets, 1, 2)
    expect(index).to be_a(Terminal::Table)
  end

  it 'index should return an empty array when passed nil' do
    index = @view.index(nil, 1, 2)
    expect(index).to be_a Array
    expect(index).to be_empty
  end

  it 'index should return an empty array if current page is greater than total' do
    index = @view.index(@ticket, 2, 1)
    expect(index).to be_a Array
    expect(index).to be_empty
  end

  it 'show should return an array' do
    expect(@view.show(@ticket)).to be_a Array
  end

  it 'show should return an empty array if passed nil' do
    expect(@view.show(nil)).to be_empty
  end
end
