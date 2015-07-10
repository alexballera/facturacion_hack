json.array!(@products) do |product|
  json.extract! product, :id, :producto, :descripcion, :precio, :user_id
  json.url operation_url(product, format: :json)
end
