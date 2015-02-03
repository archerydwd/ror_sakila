json.array!(@films) do |film|
  json.extract! film, :id, :title, :description, :release_year, :language_id, :rental_duration, :rental_rate, :length, :replacement_cost, :rating, :special_features, :last_update
  json.url film_url(film, format: :json)
end
