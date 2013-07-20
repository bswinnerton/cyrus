require 'csv'
require 'pry'
require 'awesome_print'

class DataType
  attr_accessor :raw_data, :parsed

  def initialize(filename)
    @parsed = []
    @raw_data = File.read(filename)
    parse_file
    strip_spaces
  end

  def strip_spaces
    parsed.collect do |hash|
      hash.collect do |k,v|
        v.strip!
      end
    end
  end
end
