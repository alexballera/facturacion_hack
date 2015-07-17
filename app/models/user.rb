class User < ActiveRecord::Base
  has_many :products, dependent: :destroy
  has_many :clients, dependent: :destroy
  has_many :operations, dependent: :destroy

  include PermissionsConcern  
  include Gravtastic
  gravtastic
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, :uniqueness => {:message => "Ya este usuario existe, intenta de nuevo"}, length: { maximum: 12,
    too_long: "%{count} caracteres es el máximo permitido" }

  scope :ultimos, ->{ order(created_at: :asc) }

end
