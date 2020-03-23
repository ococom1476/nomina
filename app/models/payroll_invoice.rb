class PayrollInvoice < ApplicationRecord
  	belongs_to :employee

    validates :start_date, presence: true, format: { with: /^\d{4}-\d{2}-\d{2}$/, multiline: true}
    validates :end_date, presence: true, format: { with: /^\d{4}-\d{2}-\d{2}$/, multiline: true}
    validates :employee_id, presence: true
    
    validates :concept, presence: true

    before_validation :employee_has_contract

    before_save :calculate_total

  	def calculate_total
  		self.total = (employee_gross_salary + employee_insidence_total)
  	end

  	def employee_gross_salary
      Contract.where(id: self.employee_id).active.last.gross_salary
  	end

  	def employee_insidence_total
      Incidence.where(id: self.employee_id).closed(self.start_date,self.end_date).sum(:amount)
  	end

    def employee_has_contract
	    errors.add(:employee, :inactive_contract) if self.employee && self.employee.contracts.active.blank?
	end

end
