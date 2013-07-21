require_relative 'lib/comma_data_type'
require_relative 'lib/pipe_data_type'
require_relative 'lib/space_data_type'
require_relative 'lib/record'
require_relative 'lib/record_set'

task :display_records do
  records = []

  comma_data = CommaDataType.new("data/comma.txt")
  pipe_data = PipeDataType.new("data/pipe.txt")
  space_data = SpaceDataType.new("data/space.txt")
  data = [ comma_data, pipe_data, space_data ]

  data.each do |datatype|
    datatype.parsed.each do |h|
      records << Record.new(h)
    end
  end

  record_set = RecordSet.new(records)
  puts "Output 1:"
  ap record_set.display_by :gender, :ascending
  puts "Output 2:"
  ap record_set.display_by :date_of_birth, :ascending
  puts "Output 3:"
  ap record_set.display_by :last_name, :descending
end

task default: :display_records
