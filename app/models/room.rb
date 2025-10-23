class Room < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :detail, presence: true
  validates :price, presence: true
  validates :address, presence: true
end
