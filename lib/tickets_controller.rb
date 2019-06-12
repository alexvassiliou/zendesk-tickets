require_relative 'zendesk'

class TicketsController
  def initialize(args)
    @client = args[:client]
    @per_page = args[:per_page] || 10
    @list = request_tickets
  end

  def list
    @list
  end

  def next_page
    return nil if @list.nil?
    return goto_page(@list.next) if current_page < page_count
  end

  def prev_page
    return nil if @list.nil?
    return goto_page(@list.prev) if current_page > 1
  end

  def find_ticket(id)
    return nil if @list.nil?
    ticket = @client.tickets.find(id: id)
    return nil if ticket.nil?
    ticket
  end

  def goto_page(num)
    return nil if num > page_count
    return nil if @list.nil?
    @list = @client.tickets.page(num)
  end

  def page_count
    result = @list.count / @per_page.to_f
    result.ceil
  end

  def current_page
    @list.options.page
  end

  private

  def request_tickets
    begin
      @client.tickets.page(1).per_page(@per_page)
    rescue NoMethodError => e
      puts 'API not available, try again later'
      return nil
    end
  end
end
