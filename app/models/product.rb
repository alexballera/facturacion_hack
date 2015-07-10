class Product < ActiveRecord::Base
	belongs_to :user
	has_many :operations
	validates :nombre, :precio, :presence => {:message => "No debe estar en blanco"}
  validates :nombre, length: { maximum: 30,
    too_long: "%{count} caracteres es el máximo permitido" }
  validates :descripcion, length: { maximum: 150,
    too_long: "%{count} caracteres es el máximo permitido" }
  validates :precio, length: { maximum: 10,
    too_long: "%{count} caracteres es el máximo permitido" }
end
