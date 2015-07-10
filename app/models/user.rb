class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :products
  has_many :clients
  has_many :operations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, :uniqueness => {:message => "Ya este usuario existe, intenta de nuevo"}, length: { maximum: 12,
    too_long: "%{count} caracteres es el máximo permitido" }
end
