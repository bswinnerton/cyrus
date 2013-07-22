require 'spec_helper'

describe CommaDataType do
  before :each do
    @raw_comma_data = CommaDataType.new("spec/fixtures/comma.txt")
  end

  it "should instantiate a new object" do
    @raw_comma_data.should be_a_kind_of(CommaDataType)
  end

  it "should parse comma delimited data" do
    parsed_data = @raw_comma_data.parsed
    expect(parsed_data.first).to include first_name: "Neil"
  end
end
