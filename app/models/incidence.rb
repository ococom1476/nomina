class Incidence < ApplicationRecord
  belongs_to :employee

  INCIDENCE_TYPE_OPTIONS = ['deductions','perceptions','illness','absence','delay','vacation','extrahours','extraday']

  validates :start_date, presence: true, format: { with: /^\d{4}-\d{2}-\d{2}$/, multiline: true}
  validates :end_date, presence: true, format: { with: /^\d{4}-\d{2}-\d{2}$/, multiline: true}

  validates :incidence_type, inclusion: { in: INCIDENCE_TYPE_OPTIONS }


  scope :closed, -> (start_date, end_date) {
    where('start_date >= ? AND end_date <=?', start_date, end_date)
  }

end
