require_relative 'spec_helper'

class TestRecordSet < MiniTest::Unit::TestCase
  def setup
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

    @record_set = RecordSet.new(records)
  end

  def test_fields_in_order
    output = @record_set.sort_by :date_of_birth, :ascending
    assert_equal output.first, "Abercrombie Neil Male 2/13/1943 Tan"
  end

  def test_sort_by_gender
    output = @record_set.sort_by :gender, :ascending
    assert_includes output.first, "Hingis"
    assert_includes output.last, "Smith"
  end

  def test_sort_by_birth_date
    output = @record_set.sort_by :date_of_birth, :ascending
    assert_includes output.first, "2/13/1943"
    assert_includes output.last, "3/3/1985"
  end

  def test_sort_by_last_name
    output = @record_set.sort_by :last_name, :descending
    assert_includes output.first, "Smith"
    assert_includes output.last, "Abercrombie"
  end
end
