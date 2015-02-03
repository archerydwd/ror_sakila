json.array!(@film_actors) do |film_actor|
  json.extract! film_actor, :id, :actor_id, :film_id, :last_update
  json.url film_actor_url(film_actor, format: :json)
end
