class Operation < ActiveRecord::Base
  include AASM

  belongs_to :user
  belongs_to :client
  belongs_to :product

  validates :cantidad, :fecha, :presence => {:message => "No debe estar en blanco"}
  validates :cantidad, numericality: { only_integer: true }
  validates :operacion, inclusion: { in: :operacion }
  validates :pago, inclusion: { in: :pago }
  enum operacion: [ :Compra, :Venta ]
  enum pago: [ :Contado, :Credito ]
  
  has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>"}, :default_url => "missing.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  scope :ultimos, ->{ order(created_at: :asc) }
  scope :borrador, ->{ where(state: "Borrador") }
  scope :impresas, ->{ where(state: "Emitida") }
  scope :pagadas, ->{ where(state: "Pagada") }
  scope :canceladas, ->{ where(state: "Anulada") }
  scope :compras, ->{ where(operacion: "Compra") }
  scope :ventas, ->{ where(operacion: "Venta") }
  scope :contado, ->{ where(operacion: "Contado") }
  scope :credito, ->{ where(operacion: "Credito") }

  aasm column: "state" do
    state :Borrador, initial: true
    state :Emitida
    state :Pagada
    state :Anulada

    event :print do 
      transitions from: :Borrador, to: :Emitida
    end

    event :pay do 
      transitions from: [:Borrador, :Emitida], to: :Pagada
    end

    event :cancel do 
      transitions from: [:Borrador, :Emitida], to: :Anulada
    end
  end  
end
