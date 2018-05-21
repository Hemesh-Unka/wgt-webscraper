require 'file_handler'

describe FileHandler do
  describe '.write' do
    it 'writes event data to a file' do
      fake_event_data = {
        title: 'fake event title',
        location: 'fake event location',
        date: 'fake event date',
        price: 'fake event price'
      }

      file = double('file')
      expect(File).to receive(:open).with('./results.json', 'w').and_yield(file)
      expect(file).to receive(:write).with(fake_event_data)

      FileHandler.write(fake_event_data)
    end
  end
end
