class Handicap < ActiveRecord::Base
  has_many :detailed_criterions, dependent: :delete
  has_many :users, dependent: :delete
end
