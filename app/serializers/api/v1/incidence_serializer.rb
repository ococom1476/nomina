class Api::V1::IncidenceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :incidence_type,:start_date,:end_date,:amount
  belongs_to :employee
end
