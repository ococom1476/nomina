class Api::V1::EmployeesController < Api::V1::BaseController

	def index
		employees = Employee.all.includes(:active_contracts)
		render json: Api::V1::EmployeeSerializer.new(employees,include:[:active_contracts])
	end

end