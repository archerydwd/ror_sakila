json.array!(@categories) do |category|
  json.extract! category, :id, :name, :last_update
  json.url category_url(category, format: :json)
end
