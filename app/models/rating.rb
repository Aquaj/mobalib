class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  validates :user_id, :uniqueness => { :scope => :place_id }

  def values
    [value1, value2, value3, value4, value5]
  end
end
