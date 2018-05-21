require 'parse'

describe Parse do
  before(:each) do
    local_html_path = File.join(File.dirname(__FILE__), '/html_test_files', 'wgt_p1.html')
    @doc = Nokogiri::HTML(open(local_html_path))
  end

  describe '.content' do
    it 'should parse the title, location, date and price from the first event listing' do
      expect(Parse.content(@doc)).to include(
        title: 'GELLERT SPA FULL DAY ENTRANCE TICKET',
        location: 'BUDAPEST: Gellï¿œrt Thermal Spa',
        date: 'Mon 21st May, 2018, 9:00am',
        price: '£19.80'
      )
    end

    it 'should parse the title, location, date and price from the last event listing' do
      expect(Parse.content(@doc)).to include(
        title: 'BREAKING AWAY',
        location: 'OXFORD: The Cellar',
        date: 'Mon 21st May, 2018, 7:30pm',
        price: '£4.40'
      )
    end

    it 'should handle missing data' do
      expect(Parse.content(@doc)).to include(
        title: 'ROSIE HOOD AND COHEN BRAITHWAITE-KILCOYNE',
        location: 'Mon 21st May, 2018, 7:00pm',
        date: '',
        price: ''
      )
    end
  end

  describe '.last_page?' do
    it 'returns false if a next page is present' do
      expect(Parse.last_page?(@doc)).to eq(false)
    end

    it 'returns false if a next page is not present' do
      # change to the last page of results
      local_html_path = File.join(File.dirname(__FILE__), '/html_test_files', 'wgt_lp.html')
      @doc = Nokogiri::HTML(open(local_html_path))

      expect(Parse.last_page?(@doc)).to eq(true)
    end
  end
end
