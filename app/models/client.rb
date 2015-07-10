class Client < ActiveRecord::Base
  belongs_to :user
  has_many :operations
  validates :nombre, :identificacion, :email, :telefono, :direccion, :tipo, :frecuencia, 
  :presence => {:message => "No debe estar en blanco"}
  validates :nombre, :apellido, :identificacion, :telefono, length: { in: 2..15,
    too_long: "%{count} caracteres es el máximo permitido",
    too_short: "%{count} caracteres es el minimo permitido" }
  validates :email, :identificacion, uniqueness: true
  validates :email, length: { maximum: 30,
    too_long: "%{count} caracteres es el máximo permitido" }
  validates :direccion, :descripcion, length: { maximum: 150,
    too_long: "%{count} caracteres es el máximo permitido" }
  validates :tipo, inclusion: { in: :tipo }
  validates :frecuencia, inclusion: { in: :frecuencia }
  enum tipo: [ :Cliente, :Sponsor, :Proveedor ]
	enum frecuencia: [ :Recurrente, :Puntual ]

  def full_name    
    [nombre, apellido].join(' ')    
  end 
end
