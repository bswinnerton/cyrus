class Record
  attr_reader :last_name, :first_name, :middle_initial, :gender, :favorite_color, :date_of_birth

  def initialize(attrs)
    @last_name = attrs[:last_name]
    @first_name = attrs[:first_name]
    @middle_inital = attrs[:middle_initial]
    @gender = sanitize_gender(attrs[:gender])
    @favorite_color = attrs[:favorite_color]
    @date_of_birth = attrs[:date_of_birth]
  end

  def sanitize_date
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
