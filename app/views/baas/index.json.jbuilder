json.array!(@baas) do |baa|
  json.extract! baa, :id, :signature, :user_id
  json.url baa_url(baa, format: :json)
end
