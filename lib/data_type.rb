require 'csv'
require 'pry'
require 'awesome_print'

class DataType
  attr_accessor :parsed, :delimiter, :raw_data

  def initialize(filename, delimiter)
    @parsed = []
    @delimiter = delimiter
    @raw_data = File.read(filename)
    parse_data
  end

  def parsed_file
    CSV.parse(raw_data, {col_sep: delimiter})
  end

  def parse_data
    case delimiter
    when ","
      parse_comma_data
    when "|"
      parse_pipe_data
    when " "
      parse_space_data
    end
  end

  def parse_comma_data
    parsed_file.collect do |row|
      data_attrs = {}
      data_attrs[:last_name] = row[0]
      data_attrs[:first_name] = row[1]
      data_attrs[:gender] = row[2]
      data_attrs[:favorite_color] = row[3]
      data_attrs[:date_of_birth] = row[4]
      parsed << strip_spaces(data_attrs)
    end
  end

  def parse_pipe_data
    parsed_file.collect do |row|
      data_attrs = {}
      data_attrs[:last_name] = row[0]
      data_attrs[:first_name] = row[1]
      data_attrs[:middle_initial] = row[2]
      data_attrs[:gender] = row[3]
      data_attrs[:favorite_color] = row[4]
      data_attrs[:date_of_birth] = row[5]
      parsed << strip_spaces(data_attrs)
    end
  end

  def parse_space_data
    parsed_file.collect do |row|
      data_attrs = {}
      data_attrs[:last_name] = row[0]
      data_attrs[:first_name] = row[1]
      data_attrs[:middle_initial] = row[2]
      data_attrs[:gender] = row[3]
      data_attrs[:date_of_birth] = row[4]
      data_attrs[:favorite_color] = row[5]
      parsed << strip_spaces(data_attrs)
    end
  end

  def strip_spaces(hash)
    hash.each do |k,v|
      v.strip!
    end
  end
end
