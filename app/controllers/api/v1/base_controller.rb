class Api::V1::BaseController <  ActionController::Base
	skip_before_action :verify_authenticity_token, if: :json_request?
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def json_request?
		request.format.json?
	end
 
    def invalid_resource!(resource, status = 422)
       	render json: { error: 'Invalid resource', errors: resource.errors.to_h }, status: status   
    end

    def record_not_found
        render json: { error: I18n.t(:resource_not_found) }, status: 404
    end

end