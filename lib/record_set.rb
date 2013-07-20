class RecordSet
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def display_by(type)
    case type
    when :gender
      sort_by_gender
    when :date_of_birth
      sort_by_date_of_birth
    when :last_name
      sort_by_last_name
    end
  end

private

  def sort_by_gender
    ap data
  end

  def sort_by_date_of_birth
    ap data
  end

  def sort_by_last_name
    ap data
  end
end
