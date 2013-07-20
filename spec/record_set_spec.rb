require 'spec_helper'

describe RecordSet do
  before :each do
    records = []

    comma_data = CommaDataType.new("data/comma.txt")
    pipe_data = PipeDataType.new("data/pipe.txt")
    space_data = SpaceDataType.new("data/space.txt")
    data = [ comma_data, pipe_data, space_data ]

    data.each do |datatype|
      datatype.parsed.each do |h|
        records << Record.new(h)
      end
    end

    @record_set = RecordSet.new(records)
  end

  it "should ensure fields are in correct order" do
    pending
  end

  it "should sort by gender (females before males) then by last name ascending" do
    output = @record_set.display_by :gender, :ascending
    output.first.last_name.should == "Hingis"
    output.last.last_name.should == "Smith"
  end

  it "should sort by birth date, ascending" do
    output = @record_set.display_by :date_of_birth, :ascending
    output.first.date_of_birth.should == "2/13/1943"
    output.last.date_of_birth.should == "3/3/1985"
  end

  it "should sort by last name, descending" do
    output = @record_set.display_by :last_name, :descending
    output.first.last_name.should == "Smith"
    output.last.last_name.should == "Abercrombie"
  end
end
