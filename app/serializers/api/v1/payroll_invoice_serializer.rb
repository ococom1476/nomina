class Api::V1::PayrollInvoiceSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :employee
  attributes :start_date,:end_date,:concept,:total
end
