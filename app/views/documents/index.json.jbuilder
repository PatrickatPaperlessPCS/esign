json.array!(@documents) do |document|
  json.extract! document, :id, :user_id, :signature, :date, :text1
  json.url document_url(document, format: :json)
end
