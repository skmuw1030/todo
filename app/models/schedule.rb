class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :end_date, comparison: { greater_than_or_equal_to: :start_date }, if: -> { start_date.present? && end_date.present? }
  validates :memo, length: { maximum: 500 }
end
