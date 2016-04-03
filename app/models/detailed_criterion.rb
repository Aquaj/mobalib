class DetailedCriterion < ActiveRecord::Base
  belongs_to :criterion
  belongs_to :handicap

  def to_h
    {
      name: criterion.name,
      tooltip: self.tooltip
    }
  end
end
