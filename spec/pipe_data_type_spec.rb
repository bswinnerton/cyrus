require 'spec_helper'

describe Pipe::DataType do
  before :each do
    @raw_pipe_data = Pipe::DataType.new("spec/fixtures/pipe.txt")
  end

  it "should instantiate a new object" do
    @raw_pipe_data.should be_a_kind_of(Pipe::DataType)
  end

  it "should parse pipe delimited data" do
    parsed_data = @raw_pipe_data.parsed
    expect(parsed_data.first).to include first_name: "Steve"
  end
end
