class Place < ActiveRecord::Base
  has_many :ratings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  after_validation :yelpify, if: :address_changed?

  def is_certified?
    certification != "" && !certification.nil?
  end

  def yelpify
    params = {
               term: name[0...50],
               limit: 1
             }

    locale = {
               lang: 'fr'
             }
    if !latitude.nil? && !longitude.nil?
      coordinates = { latitude: latitude, longitude: longitude, accuracy: 1.00 }
      p coordinates, params, locale
      response = Yelp.client.search_by_coordinates(coordinates, params, locale)
      if !response.businesses.empty?
        yelp_id = response.businesses.first.id
      end
    end
  end


  def self.sorted
    all
  end

  def ratings_for(handikey)
    result = Hash.new(nil)
    handicap = Handicap.find_by_handikey(handikey)
    handicap.detailed_criterions.each do |dc|
      result[dc.criterion.name] = []
    end
    self.ratings
    .select { |rating| rating.user.handicap == handicap }
    .each do |review|
      review.details.each do |crit, v|
        result[crit] << v
      end
    end
    result.each do |k, v|
      if v.length == 0
        result[k] = nil
      else
        result[k] = v.reduce(&:+)/v.length
      end
    end
    result
  end

  def average_ratings_by_handicap
    arbh = Hash.new(nil)
    Handicap.all.each do |handicap|
      values = self.ratings
      .select { |rating| rating.user.handicap == handicap }
      .map { |rating| rating.values.reduce(&:+)/rating.values.length }
      if values.length != 0
        arbh[handicap.handikey] = values.reduce(&:+)/values.length
      else
        arbh[handicap.handikey] = nil
      end
    end
    arbh
  end
end
