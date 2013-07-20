require 'spec_helper'

describe Record do
  it "should respond to specific attributes" do
    comma_data = CommaDataType.new("spec/fixtures/comma.txt")
    record = Record.new(comma_data.parsed.first)
    record.first_name.should == "Neil"
  end

  it "should sanitize gender strings" do
    raw_data = {gender: "M"}
    record = Record.new(raw_data)
    record.gender.should == "Male"
  end
end
