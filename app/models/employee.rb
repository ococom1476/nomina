class Employee < ApplicationRecord
	has_many :contracts
	has_many :incidences
	has_many :payroll_invoices

	has_many :active_contracts, -> { active }, class_name: 'Contract'



end
