json.array!(@film_categories) do |film_category|
  json.extract! film_category, :id, :film_id, :category_id, :last_update
  json.url film_category_url(film_category, format: :json)
end
