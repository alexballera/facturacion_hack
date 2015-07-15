class Operation < ActiveRecord::Base
  include AASM

  belongs_to :user
  belongs_to :client
  belongs_to :product

  validates :cantidad, :fecha, :client_id, :product_id, :presence => {:message => "No debe estar en blanco"}
  validates :cantidad, numericality: { only_integer: true }
  validates :operacion, inclusion: { in: :operacion }
  validates :pago, inclusion: { in: :pago }
  enum operacion: [ :Compra, :Venta ]
  enum pago: [ :Contado, :Credito ]
  after_create :send_mail
  
  has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>"}, :default_url => "missing.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  scope :ultimos, ->{ order(created_at: :asc) }
  scope :borradores, ->{ where(state: "Borrador") }
  scope :impresas, ->{ where(state: "Emitida") }
  scope :pagadas, ->{ where(state: "Pagada") }
  scope :canceladas, ->{ where(state: "Anulada") }
  scope :compras, ->{ where(operacion: 0) }
  scope :ventas, ->{ where(operacion: 1) }
  scope :contado, ->{ where(pago: 0) }
  scope :credito, ->{ where(pago: 1) }

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
      transitions from: [:Borrador, :Emitida, :Pagada], to: :Anulada
    end
  end 

  def send_mail
     OperationMailer.new_operation(self).deliver_now
  end

end
