json.array!(@languages) do |language|
  json.extract! language, :id, :name, :last_update
  json.url language_url(language, format: :json)
end
