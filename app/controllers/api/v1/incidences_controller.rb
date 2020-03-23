class Api::V1::IncidencesController < Api::V1::BaseController

	def create
	  	@incidence = Incidence.new(incidence_params)
        if @incidence.save
        	render json: Api::V1::IncidenceSerializer.new(@incidence)
        else
            invalid_resource!(@incidence)
        end
	end

	private

    def incidence_params
      params.require(:incidence).permit(:employee_id, :incidence_type, :start_date, :end_date,:amount)
    end

end