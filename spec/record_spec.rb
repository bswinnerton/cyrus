require 'spec_helper'

describe Record do
  it "should respond to specific attributes" do
    comma_data = CommaDataType.new("spec/fixtures/comma.txt")
    record = Record.new(comma_data.parsed.first)
    record.first_name.should == "Neil"
  end
end
