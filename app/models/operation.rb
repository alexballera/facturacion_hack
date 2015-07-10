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

  has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>"}, :default_url => "missing.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

end
