require 'terminal-table'
# presentation logic for tickets
class TicketsView
  def index(objects, current_page, total_pages)
    rows = []
    if !objects.nil? && total_pages >= current_page
      objects.each do |object|
        rows << [ object[:id],
                  object[:status],
                  object[:created_at],
                  object[:updated_at],
                  object[:submitter_id],
                  object[:subject]]
      end
      Terminal::Table.new title: "TICKETS LIST: p. #{current_page} / #{total_pages}",
                          headings: ['ID', 'Status', 'Created', 'Updated', 'Submitter', 'Subject'],
                          rows: rows
    else
      return []
    end
  end

  def show(object)
    if !object.nil?
      [
        ['TICKET DETAILS'],
        [''],
        ["ID:             #{object[:id]}"],
        ["url:            #{object[:url]}"],
        ["status:         #{object[:status]}"],
        ["created:        #{object[:created_at]}"],
        ["by:             #{object[:submitter_id]}"],
        ["assigned:       #{object[:assignee_id]}"],
        ["tags:           #{object[:tags]}"],
        ["subject:        #{object[:subject]}"],
        ['description:'],
        [object[:description].to_s]
      ]
    else
      return []
    end
  end

  def no_results
    ['NO RESULTS FOUND']
  end
end
