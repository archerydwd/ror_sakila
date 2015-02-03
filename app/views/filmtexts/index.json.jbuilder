json.array!(@filmtexts) do |filmtext|
  json.extract! filmtext, :id, :title, :description
  json.url filmtext_url(filmtext, format: :json)
end
