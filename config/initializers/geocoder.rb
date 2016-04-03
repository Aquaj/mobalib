Geocoder.configure(
  timeout: 15,
  lookup:    :google,
  api_key:   ENV['GOOGLE_GEOCODING_KEY'],
  use_https: true,
  units:     :km,
  always_raise: :all,
  language: :fr
)
