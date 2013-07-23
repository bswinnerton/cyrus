require_relative 'spec_helper'

class TestRecord < MiniTest::Unit::TestCase
  def test_attributes_if_comma
    comma_data = InputData.new("spec/fixtures/comma.txt", ",")
    record = Record.new(comma_data.parsed.first)
    assert_equal record.first_name, "Neil"
  end

  def test_attributes_if_pipe
    pipe_data = InputData.new("spec/fixtures/pipe.txt", "|")
    record = Record.new(pipe_data.parsed.first)
    assert_equal record.first_name, "Steve"
  end

  def test_attributes_if_space
    space_data = InputData.new("spec/fixtures/space.txt", " ")
    record = Record.new(space_data.parsed.first)
    assert_equal record.first_name, "Anna"
  end

  def test_sanitize_gender_attribute
    raw_data = {gender: "M"}
    record = Record.new(raw_data)
    assert_equal record.gender, "Male"
  end

  def test_sanitize_date_attribute
    raw_data = {date_of_birth: "11-25-1989"}
    record = Record.new(raw_data)
    assert_equal record.date_of_birth, "11/25/1989"
  end
end
