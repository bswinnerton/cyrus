require 'spec_helper'

describe Space::DataType do
  before :each do
    @raw_space_data = Space::DataType.new("spec/fixtures/space.txt")
  end

  it "should instantiate a new object" do
    @raw_space_data.should be_a_kind_of(Space::DataType)
  end

  it "should parse space delimited data" do
    parsed_data = @raw_space_data.parsed
    expect(parsed_data.first).to include first_name: "Anna"
  end
end
