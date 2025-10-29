class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :start_date, presence: true
  validate :start_date_limitation
  validates :end_date, presence: true
  validate :end_date_limitation
  validates :num_user, numericality: true, presence: true

  def start_date_limitation
    return false if start_date.blank?
    if start_date < Date.today
      errors.add(:start_date, "に本日以前の日付は選択できません")
    end
  end

  def end_date_limitation
    return false if start_date.blank? || end_date.blank?
    if start_date > end_date
      errors.add(:end_date, "に開始日以前の日付は選択できません")
    end
  end
end
