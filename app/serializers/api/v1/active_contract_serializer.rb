class Api::V1::ActiveContractSerializer
  include FastJsonapi::ObjectSerializer
  attributes :gross_salary,:payroll_type,:active
end
