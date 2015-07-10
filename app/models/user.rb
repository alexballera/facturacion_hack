class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, length: { maximum: 12,
    too_long: "%{count} caracteres es el máximo permitido" }
  has_many :products
  has_many :clients
  has_many :operations
end
