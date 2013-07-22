require 'spec_helper'

describe Comma::DataType do
  before :each do
    @raw_comma_data = Comma::DataType.new("spec/fixtures/comma.txt")
  end

  it "should instantiate a new object" do
    @raw_comma_data.should be_a_kind_of(Comma::DataType)
  end

  it "should parse comma delimited data" do
    parsed_data = @raw_comma_data.parsed
    expect(parsed_data.first).to include first_name: "Neil"
  end
end
