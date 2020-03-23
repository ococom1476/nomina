class Api::V1::EmployeeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name,:last_name,:rfc,:date
  has_many :active_contracts
end
