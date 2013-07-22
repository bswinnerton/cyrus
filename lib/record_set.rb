class RecordSet
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def display_by(type, order = :ascending)
    case type
    when :gender
      sorted = sort_by_gender order
      display sorted
    when :date_of_birth
      sorted = sort_by_date_of_birth order
      display sorted
    when :last_name
      sorted = sort_by_last_name order
      display sorted
    end
  end

private

  def display(sorted)
    sorted.collect do |record|
      "#{record.last_name} #{record.first_name} #{record.gender} #{record.date_of_birth} #{record.favorite_color}"
    end
  end

  def sort_by_gender(order)
    if order == :ascending
      data.sort_by! { |record| [record.gender, record.last_name] }
    elsif order == :descending
      data.sort_by! { |record| [record.gender, record.last_name] }.reverse
    end
  end

  def sort_by_date_of_birth(order)
    if order == :ascending
      data.sort_by! do |record| 
        date_array = Record.date_to_array(record.date_of_birth)
        [date_array[2], date_array[0], date_array[1]]
      end
    elsif order == :descending
      data.sort_by! do |record| 
        date_array = Record.date_to_array(record.date_of_birth)
        [date_array[2], date_array[0], date_array[1]]
      end
      data.reverse
    end
  end

  def sort_by_last_name(order)
    if order == :ascending
      data.sort_by { |record| record.last_name }
    elsif order == :descending
      data.sort_by { |record| record.last_name }.reverse!
    end
  end
end
