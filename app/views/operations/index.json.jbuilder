json.array!(@operations) do |operation|
  json.extract! operation, :id, :operacion, :pago, :cantidad, :subtotal, :impuestos, :total, :tasa, :fecha, :cover, :state, :user_id, :product_id, :client_id, :created_at, :updated_at
  json.url operation_url(operation, format: :json)
end
