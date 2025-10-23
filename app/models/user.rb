class User < ApplicationRecord
  has_one_attached :avatar

  has_many :rooms
  has_many :reservations

  attr_accessor :current_password
  
  validates :name, presence: true
  validates :introduction, length: { maximum: 500 }
  validates :password, presence: true, on: :create

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
