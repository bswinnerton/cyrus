require 'spec_helper'

describe RecordSet do
  before :each do
    records = []

    comma_data = DataType.new("data/comma.txt", ",")
    pipe_data = DataType.new("data/pipe.txt", "|")
    space_data = DataType.new("data/space.txt", " ")
    data = [ comma_data, pipe_data, space_data ]

    data.each do |datatype|
      datatype.parsed.each do |h|
        records << Record.new(h)
      end
    end

    @record_set = RecordSet.new(records)
  end

  it "should ensure fields are in correct order" do
    output = @record_set.sort_by :date_of_birth, :ascending
    output.first.should == "Abercrombie Neil Male 2/13/1943 Tan"
  end

  it "should sort by gender (females before males) then by last name ascending" do
    output = @record_set.sort_by :gender, :ascending
    output.first.should include "Hingis"
    output.last.should include "Smith"
  end

  it "should sort by birth date, ascending" do
    output = @record_set.sort_by :date_of_birth, :ascending
    output.first.should include "2/13/1943"
    output.last.should include "3/3/1985"
  end

  it "should sort by last name, descending" do
    output = @record_set.sort_by :last_name, :descending
    output.first.should include "Smith"
    output.last.should include "Abercrombie"
  end
end
