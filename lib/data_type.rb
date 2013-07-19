require 'csv'
require 'pry'
require 'awesome_print'

class DataType
  attr_accessor :raw_data, :parsed

  def initialize(filename)
    @parsed = []
    @raw_data = File.read(filename)
    parse_file
  end
end
