require 'terminal-table'

module ZendeskTicket
  # presentation logic for tickets
  class TicketsView
    def index(objects, current_page, total_pages)
      rows = []
      if !objects.nil? && total_pages >= current_page
        objects.each do |object|
          rows << [ object[:id],
                    object[:status],
                    object[:subject],
                    object[:tags],
                    object[:assignee_id],
                    object[:submitter_id],
                    object[:updated_at],
                    ]
        end
        Terminal::Table.new title: "TICKETS LIST: p. #{current_page} / #{total_pages}",
                            headings: [ 'ID',
                                        'Status',
                                        'Subject',
                                        'Tags',
                                        'Assigned To',
                                        'Created By',
                                        'Last Update'],
                            rows: rows
      else
        return nil
      end
    end

    def show(object)
      if object.nil? || object.empty?
        return nil
      else
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
      end
    end

    def no_connection
      [
        [''],
        ['**** Client connection is down ****'],
        ['**** Please check your network connection ****'],
        ['**** And ensure you have the correct access rights ****'],
        ['']
      ]
    end

    def no_results
      [
        [''],
        ['NO RESULTS FOUND'],
        ['']
      ]
    end
  end
end
