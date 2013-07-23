require_relative 'spec_helper'

class TestInputData < MiniTest::Unit::TestCase
  def test_instantiation_of_comma_data
    raw_comma_data = InputData.new("spec/fixtures/comma.txt", ",")
    assert_kind_of InputData, raw_comma_data
  end

  def test_instantiation_of_pipe_data
    raw_pipe_data = InputData.new("spec/fixtures/pipe.txt", "|")
    assert_kind_of InputData, raw_pipe_data
  end

  def test_instantiation_of_space_data
    raw_space_data = InputData.new("spec/fixtures/space.txt", " ")
    assert_kind_of InputData, raw_space_data
  end

  def test_parse_of_comma_data
    raw_comma_data = InputData.new("spec/fixtures/comma.txt", ",")
    parsed_data = raw_comma_data.parsed
    assert_equal parsed_data.first[:first_name], "Neil"
  end

  def test_parse_of_pipe_data
    raw_pipe_data = InputData.new("spec/fixtures/pipe.txt", "|")
    parsed_data = raw_pipe_data.parsed
    assert_equal parsed_data.first[:first_name], "Steve"
  end

  def test_parse_of_space_data
    raw_space_data = InputData.new("spec/fixtures/space.txt", " ")
    parsed_data = raw_space_data.parsed
    assert_equal parsed_data.first[:first_name], "Anna"
  end
end
