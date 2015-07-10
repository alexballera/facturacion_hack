json.array!(@products) do |product|
  json.extract! product, :id, :nombre, :descripcion, :precio, :cantidad, :user_id
  json.url operation_url(product, format: :json)
end
