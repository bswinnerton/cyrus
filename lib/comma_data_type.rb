require_relative 'data_type'

module Comma
  class Comma::DataType < DataType
    def parsed_file
      CSV.parse(raw_data)
    end

    def parse_data
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
  end
end
