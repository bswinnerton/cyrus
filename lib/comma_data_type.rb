require 'csv'
require 'pry'

class CommaDataType
  attr_accessor :raw_data, :parsed

  def initialize(filename)
    @parsed = []
    @raw_data = File.read(filename)
  end

  def parsed_data
    CSV.parse(raw_data)
  end

  def parse_file
    data_attrs = {}
    parsed = parsed_data.map do |row|
      data_attrs[:last_name] = row[0]
      data_attrs[:first_name] = row[1]
      data_attrs[:gender] = row[2]
      data_attrs[:favorite_color] = row[3]
      data_attrs[:date_of_birth] = row[4]
    end
  end
end

c = CommaDataType.new("spec/fixtures/comma.txt")
puts c.parse_file
