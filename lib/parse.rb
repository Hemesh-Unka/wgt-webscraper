class Parse
  class << self
    def content(data)
      events = []
      listings(data).each do |event|
        events.push(
          title: title(event),
          location: location(event),
          date: date(event),
          price: price(event)
        )
      end
      events
    end

    def next_page?(data)
      !data.css('a.pagination_link_text.nextlink').empty?
    end

    private

    def listings(event)
      event.css('div.content.block-group.chatterbox-margin')
    end

    def title(event)
      event.css('a.event_link').text
    end

    def location(event)
      event.css('div.venue-details h4')[0].text
    end

    def date(event)
      event.css('div.venue-details h4')[1].text
    end

    def price(event)
      event.css('div.searchResultsPrice strong').text
    end
  end
end
