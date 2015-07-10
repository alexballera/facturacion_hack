json.array!(@operations) do |operation|
  json.extract! operation, :id, :operacion, :pago, :factura, :cantidad, :subtotal, :impuestos, :total, :tasa, :balance, :fecha, :comprobante, :cover, :products, :user_id, :client_id, :product_id
  json.url operation_url(operation, format: :json)
end
