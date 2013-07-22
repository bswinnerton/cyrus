require 'spec_helper'

describe DataType do
  it "should instantiate a new object when comma delimited" do
    raw_data = DataType.new("spec/fixtures/comma.txt", ",")
    raw_data.should be_a_kind_of(DataType)
  end

  it "should instantiate a new object when pipe delimited" do
    raw_data = DataType.new("spec/fixtures/pipe.txt", "|")
    raw_data.should be_a_kind_of(DataType)
  end

  it "should instantiate a new object when pipe delimited" do
    raw_data = DataType.new("spec/fixtures/space.txt", " ")
    raw_data.should be_a_kind_of(DataType)
  end

  it "should parse comma delimited data" do
    raw_comma_data = DataType.new("spec/fixtures/comma.txt", ",")
    parsed_data = raw_comma_data.parsed
    expect(parsed_data.first).to include first_name: "Neil"
  end

  it "should parse pipe delimited data" do
    raw_pipe_data = DataType.new("spec/fixtures/pipe.txt", "|")
    parsed_data = raw_pipe_data.parsed
    expect(parsed_data.first).to include first_name: "Steve"
  end

  it "should parse comma delimited data" do
    raw_space_data = DataType.new("spec/fixtures/space.txt", " ")
    parsed_data = raw_space_data.parsed
    expect(parsed_data.first).to include first_name: "Anna"
  end
end
