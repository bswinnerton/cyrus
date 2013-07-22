class RecordSet
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def sort_by(field, sort_type = :ascending)
    sorted = case field
      when :gender then sort_by_gender sort_type
      when :date_of_birth then sort_by_date_of_birth sort_type
      when :last_name then sort_by_last_name sort_type
    end
    render sorted
  end

private

  def render(sorted)
    sorted.collect do |record|
      "#{record.last_name} #{record.first_name} #{record.gender} #{record.date_of_birth} #{record.favorite_color}"
    end
  end

  def sort_by_gender(sort_type)
    result = data.sort_by! { |record| [record.gender, record.last_name] }
    sort_type == :descending ? result.reverse : result
  end

  def sort_by_date_of_birth(sort_type)
    result = data.sort_by! do |record|
      date_array = Record.date_to_array(record.date_of_birth)
      [date_array[2], date_array[0], date_array[1]]
    end
    sort_type == :descending ? result.reverse : result
  end

  def sort_by_last_name(sort_type)
    result = data.sort_by { |record| record.last_name }
    sort_type == :descending ? result.reverse : result
  end
end
