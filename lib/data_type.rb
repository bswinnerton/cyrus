require 'csv'
require 'pry'
require 'awesome_print'

class DataType
  attr_accessor :raw_data, :parsed

  def initialize(filename)
    @parsed = []
    @raw_data = File.read(filename)
    parse_data
  end

  def strip_spaces(hash)
    hash.each do |k,v|
      v.strip!
    end
  end
end
