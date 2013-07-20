class RecordSet
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def display_by(type, order = :ascending)
    case type
    when :gender
      sort_by_gender order
    when :date_of_birth
      sort_by_date_of_birth order
    when :last_name
      sort_by_last_name order
    end
  end

private

  def sort_by_gender(order)
    data
  end

  def sort_by_date_of_birth(order)
    data
  end

  def sort_by_last_name(order)
    if order == :ascending
      data.sort_by { |record| record.last_name }
    elsif order == :descending
      data.sort_by { |record| record.last_name }.reverse!
    end
  end
end
