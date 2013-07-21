require 'date'

class Record
  attr_accessor :date_of_birth
  attr_reader :last_name, :first_name, :middle_initial, :gender, :favorite_color

  def initialize(attrs)
    @last_name = attrs[:last_name]
    @first_name = attrs[:first_name]
    @middle_inital = attrs[:middle_initial]
    @gender = sanitize_gender(attrs[:gender])
    @favorite_color = attrs[:favorite_color]
    @date_of_birth = sanitize_date(attrs[:date_of_birth])
  end

private

  def sanitize_date(date_string)
    date_array_str = date_to_array(date_string)
    date_array_num = date_to_i(date_array_str)

    formatted_date = Date.new(date_array_num[2], date_array_num[0], date_array_num[1])
  end

  def date_to_array(date)
    if date.include? "/"
      date.split "/"
    elsif date.include? "-"
      date.split "-"
    end
  end

  def date_to_i(date_array)
    date_array.map do |date|
      date.to_i
    end
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
