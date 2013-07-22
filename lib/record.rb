require 'date'

class Record
  attr_reader :last_name, :first_name, :middle_initial, :gender, :favorite_color, :date_of_birth

  def initialize(attrs)
    @last_name = attrs[:last_name]
    @first_name = attrs[:first_name]
    @middle_inital = attrs[:middle_initial]
    @gender = sanitize_gender(attrs[:gender]) unless attrs[:gender].nil?
    @favorite_color = attrs[:favorite_color]
    @date_of_birth = sanitize_date(attrs[:date_of_birth]) unless attrs[:date_of_birth].nil?
  end

  def self.date_to_array(date)
    if date.include? "/"
      date.split "/"
    elsif date.include? "-"
      date.split "-"
    end
  end

private

  def sanitize_date(date_string)
    date_array = Record.date_to_array(date_string)
    Date.new(date_array[2].to_i, date_array[0].to_i, date_array[1].to_i).strftime("%-m/%-d/%Y")
  end

  def sanitize_gender(gender)
    if gender == "M"
      gender = "Male"
    elsif gender == "F"
      gender = "Female"
    else
      gender
    end
  end
end
