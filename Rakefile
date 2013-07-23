require_relative 'lib/input_data'
require_relative 'lib/record'
require_relative 'lib/record_set'

task :display_records do
  records = []

  comma_data = InputData.new("data/comma.txt", ",")
  pipe_data = InputData.new("data/pipe.txt", "|")
  space_data = InputData.new("data/space.txt", " ")
  data = [ comma_data, pipe_data, space_data ]

  data.each do |datatype|
    datatype.parsed.each do |h|
      records << Record.new(h)
    end
  end

  record_set = RecordSet.new(records)

  puts "Output 1:"
  puts record_set.sort_by :gender, :ascending
  puts
  puts "Output 2:"
  puts record_set.sort_by :date_of_birth, :ascending
  puts
  puts "Output 3:"
  puts record_set.sort_by :last_name, :descending
end

task default: :display_records
