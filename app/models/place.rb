class Place < ActiveRecord::Base
  has_many :ratings
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  after_validation :yelpify, if: :address_changed?

  def is_certified?
    certification != "" && !certification.nil?
  end

  def yelpify
    params = {
               term: name,
               limit: 1
             }

    locale = {
               lang: 'fr'
             }

    coordinates = { latitude: latitude, longitude: longitude, accuracy: 1.00 }
    response = Yelp.client.search_by_coordinates(coordinates, params, locale)
    if !response.businesses.empty?
      yelp_id = response.businesses.first.id
    end
  end


  def self.sort
    all.sort { |e, f| e.average_rating - f.average_rating }
  end
end
