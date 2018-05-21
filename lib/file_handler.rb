class FileHandler
  def self.write(data)
    File.open('./results.json', 'w') do |file|
      file.write(data)
    end
  end
end
