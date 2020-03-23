class Api::V1::PayrollInvoicesController < Api::V1::BaseController

	before_action :set_employees, only: [:index ]

	def index
		render json: Api::V1::PayrollInvoiceSerializer.new(@employee.payroll_invoices)
	end

	def create
	  	@payroll_invoice = PayrollInvoice.new(payroll_invoice_params)
        if @payroll_invoice.save
        	render json: Api::V1::PayrollInvoiceSerializer.new(@payroll_invoice)
        else
            invalid_resource!(@payroll_invoice)
        end
	end

	def set_employees
		@employee = Employee.find(params[:employee_id])
	end

	private

	def payroll_invoice_params
      params.require(:payroll_invoice).permit(:employee_id,:concept, :start_date, :end_date)
    end

end