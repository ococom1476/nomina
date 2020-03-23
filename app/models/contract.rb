class Contract < ApplicationRecord
  belongs_to :employee

  validates_uniqueness_of :employee_id, scope: ([:active]), conditions: -> { where(active: [1])}

  scope :active, ->{where(active: 1)}
end
