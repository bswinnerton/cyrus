require 'spec_helper'

describe CommaDataType do
  it "should read in a comma delimited file" do
    raw_comma_data = CommaDataType.new("spec/fixtures/comma.txt")
    parsed_data = raw_comma_data.parsed
    expect(parsed_data.first).to include(:first_name)
  end

  it "should parse comma delimited data" do
  end
end
