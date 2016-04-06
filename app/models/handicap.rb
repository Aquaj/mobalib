class Handicap < ActiveRecord::Base
  has_many :detailed_criterions, dependent: :destroy
  has_many :users, dependent: :destroy
end
