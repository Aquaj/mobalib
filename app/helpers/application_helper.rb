module ApplicationHelper
  def color_by_rating(rating)
    if rating.nil?
      return 'grey'
    elsif rating.round == 0
      return 'red'
    elsif rating.round == 1
      return 'orange'
    else
      return 'green'
    end
  end
end
