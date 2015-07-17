class Client < ActiveRecord::Base
  include Gravtastic
  gravtastic
  
  belongs_to :user
  has_many :operations, dependent: :destroy
  validates :nombre, :identificacion, :email, :telefono, :direccion, :tipo, :frecuencia, 
  :presence => {:message => "No debe estar en blanco"}
  validates :nombre, :apellido, :identificacion, :telefono, length: { in: 2..15,
    too_long: "%{count} caracteres es el máximo permitido",
    too_short: "%{count} caracteres es el minimo permitido" }
  validates :email, :identificacion, uniqueness: true
  validates :email, length: { maximum: 30,
    too_long: "%{count} caracteres es el máximo permitido" }
  validates :direccion, length: { maximum: 150,
    too_long: "%{count} caracteres es el máximo permitido" }
  validates :tipo, inclusion: { in: :tipo }
  validates :frecuencia, inclusion: { in: :frecuencia }
  enum tipo: [ :Cliente, :Sponsor, :Proveedor ]
	enum frecuencia: [ :Recurrente, :Puntual ]

  scope :ultimos, ->{ order(created_at: :asc) }
  scope :clientes, ->{ where(tipo: 0) }
  scope :sponsor, ->{ where(tipo: 1) }
  scope :proveedores, ->{ where(tipo: 2) }
  scope :recurrentes, ->{ where(frecuencia: 0) }
  scope :puntuales, ->{ where(tipo: 1) }

  def full_name    
    [nombre, apellido].join(' ')    
  end   
end
