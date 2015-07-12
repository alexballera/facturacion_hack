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

  scope :borrador, ->{ where(state: "in_draft") }
  scope :impresas, ->{ where(state: "printed") }
  scope :pagadas, ->{ where(state: "paid") }
  scope :canceladas, ->{ where(state: "canceled") }
  scope :compras, ->{ where(operacion: "Compra") }
  scope :ventas, ->{ where(operacion: "Venta") }
  scope :contado, ->{ where(operacion: "Contado") }
  scope :credito, ->{ where(operacion: "Credito") }

  aasm column: "state" do
    state :in_draft, initial: true
    state :printed
    state :paid
    state :canceled

    event :print do 
      transitions from: :in_draft, to: :printed
    end

    event :pay do 
      transitions from: [:in_draft, :printed], to: :paid
    end

    event :cancel do 
      transitions from: [:in_draft, :printed], to: :canceled
    end
  end
end
