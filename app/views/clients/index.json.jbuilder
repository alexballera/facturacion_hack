json.array!(@clients) do |client|
  json.extract! client, :id, :nombre, :apellido, 
			:identificacion, :email, :telefono, :direccion, :tipo, :frecuencia, :user_id
  json.url operation_url(client, format: :json)
end
