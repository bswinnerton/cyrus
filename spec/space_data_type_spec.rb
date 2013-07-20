require 'spec_helper'

describe SpaceDataType do
  before :each do
    @raw_space_data = SpaceDataType.new("spec/fixtures/space.txt")
  end

  it "should instantiate a new object" do
    @raw_space_data.should be_a_kind_of(SpaceDataType)
  end

  it "should parse space delimited data" do
    parsed_data = @raw_space_data.parsed
    expect(parsed_data.first).to include(first_name: "Anna")
  end
end
