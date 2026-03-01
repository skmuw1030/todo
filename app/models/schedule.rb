class Schedule < ApplicationRecord
  TITLE_MAX_LENGTH =20
  MEMO_MAX_LENGTH  =500


  validates :title, presence: true, length: { maximum: TITLE_MAX_LENGTH  }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :memo, length: { maximum: MEMO_MAX_LENGTH }

  validate :date_check

  private

  def date_check
    return if start_date.blank? || end_date.blank?

    if end_date < start_date
      errors.add(:end_date, "は開始日以降の日付を選択してください")
    end
  end
end
