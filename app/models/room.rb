class Room < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :detail, presence: true
  validates :price, numericality: true, presence: true
  validate :price_limitation
  validates :address, presence: true

  def price_limitation
    return false if price.blank?
    if price <= 0
      errors.add(:price, "は１円以上にしてください")
    end
  end
end
