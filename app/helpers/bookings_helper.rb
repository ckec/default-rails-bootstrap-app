module BookingsHelper
  def ordinal_number(index)
    case index
    when 0
      'First'
    when 1
      'Second'
    when 2
      'Third'
    else
      "#{index + 1}th"
    end
  end
end
