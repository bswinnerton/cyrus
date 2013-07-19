class Record
  attr_reader :last_name, :first_name, :middle_initial, :gender, :favorite_color, :date_of_birth

  def initialize(args)
    @last_name = args[:last_name]
    @first_name = args[:first_name]
    @middle_inital = args[:middle_initial]
    @gender = args[:gender]
    @favorite_color = args[:favorite_color]
    @date_of_birth = args[:date_of_birth]
  end
end
