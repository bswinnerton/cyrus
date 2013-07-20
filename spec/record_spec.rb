require 'spec_helper'

describe Record do
  it "should respond to specific attributes" do
    comma_data = CommaDataType.new("spec/fixtures/comma.txt")
    record = Record.new(comma_data.parsed.first)
    record.first_name.should == "Neil"
  end

  it "should sanitize gender strings" do
    raw_data = {gender: "M", date_of_birth: "11-25-1989"}
    record = Record.new(raw_data)
    record.gender.should == "Male"
  end

  it "should sanitize date strings" do
    raw_data = {gender: "M", date_of_birth: "11-25-1989"}
    record = Record.new(raw_data)
    record.date_of_birth.should == "11/25/1989"
  end
end
