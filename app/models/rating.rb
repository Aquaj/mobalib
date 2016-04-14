class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  validates :user_id, :uniqueness => { :scope => :place_id }

  def values
    [value1, value2, value3, value4, value5]
  end

  def details
    result = {}
    values.each_with_index do |value, index|
      crit = user.handicap.detailed_criterions[index].criterion.name
      result[crit] = value
    end
    result
  end
end
