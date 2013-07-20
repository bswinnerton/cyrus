require_relative 'data_type'

class PipeDataType < DataType
  def parsed_file
    CSV.parse(raw_data, {col_sep: '|'})
  end

  def parse_data
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
end
