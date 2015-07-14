class Product < ActiveRecord::Base
	belongs_to :user
	has_many :operations
  # validates :cantidad, numericality: { only_integer: true }, length: { maximum: 2,
  #   too_long: "%{count} caracteres es el máximo permitido" }
	validates :producto, :precio, :presence => {:message => "No debe estar en blanco"}
  validates :producto, length: { maximum: 30,
    too_long: "%{count} caracteres es el máximo permitido" }
  validates :descripcion, length: { maximum: 150,
    too_long: "%{count} caracteres es el máximo permitido" }
  validates :precio, length: { maximum: 10,
    too_long: "%{count} caracteres es el máximo permitido" }

  scope :ultimos, ->{ order(created_at: :asc) }
end
