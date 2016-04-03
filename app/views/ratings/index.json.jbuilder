json.array!(@ratings) do |rating|
  json.extract! rating, :id, :value, :user_id, :place_id
  json.url rating_url(rating, format: :json)
end
