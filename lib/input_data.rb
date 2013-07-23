require 'csv'

class InputData
  attr_accessor :parsed, :delimiter, :raw_data

  COMMA_FIELDS = [:last_name, :first_name, :gender, :favorite_color, :date_of_birth]
  PIPE_FIELDS = [:last_name, :first_name, :middle_initial, :gender, :favorite_color, :date_of_birth]
  SPACE_FIELDS = [:last_name, :first_name, :middle_initial, :gender, :date_of_birth, :favorite_color]

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
      parse(COMMA_FIELDS)
    when "|"
      parse(PIPE_FIELDS)
    when " "
      parse(SPACE_FIELDS)
    end
  end

  def parse(field_type)
    parsed_file.collect do |row|
      data_attrs = {}
      field_type.each_with_index do |field, i|
        data_attrs[field] = row[i]
      end
      parsed << strip_spaces(data_attrs)
    end
  end

  def strip_spaces(hash)
    hash.each do |k,v|
      v.strip!
    end
  end
end
