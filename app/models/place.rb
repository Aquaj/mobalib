class Place < ActiveRecord::Base
  has_many :ratings
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def is_certified?
    certification != "" && !certification.nil?
  end
end
