class Product < ActiveRecord::Base
	validates :nombre, :precio, presence: true
  validates :nombre, length: { maximum: 30 }
  validates :descripcion, length: { maximum: 150 }
  validates :precio, length: { maximum: 10 }
end
