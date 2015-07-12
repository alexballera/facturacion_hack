class Client < ActiveRecord::Base
  include Gravtastic
  gravtastic
  
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

  scope :clientes, ->{ where(tipo: "Cliente") }
  scope :sponsor, ->{ where(tipo: "Sponsor") }
  scope :proveedores, ->{ where(tipo: "Proveedor") }
  scope :recurrentes, ->{ where(frecuencia: "Recurrente") }
  scope :puntuales, ->{ where(tipo: "Puntual") }

  def full_name    
    [nombre, apellido].join(' ')    
  end 

  def avatar
    # get the email from URL-parameters or what have you and make lowercase
    email_address = self.email.downcase
     
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)
     
    # compile URL which can be used in <img src="RIGHT_HERE"...
    image_src = "http://www.gravatar.com/avatar/#{hash}"
  end
end
