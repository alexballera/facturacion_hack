class Operation < ActiveRecord::Base
  belongs_to :user
  belongs_to :client
  belongs_to :product
  validates :cantidad, :fecha, :presence => {:message => "No debe estar en blanco"}
  validates :cantidad, numericality: { only_integer: true }
  validates :operacion, inclusion: { in: :operacion }
  validates :pago, inclusion: { in: :pago }
  validates :factura, inclusion: { in: :factura }
  enum operacion: [ :Compra, :Venta ]
  enum pago: [ :Contado, :Credito ]
  enum factura: [ :Borrador, :Factura ]
end
