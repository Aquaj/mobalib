class Criterion < ActiveRecord::Base
  has_many :detailed_criterions, dependent: :destroy
end
