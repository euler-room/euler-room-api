module Api::V3::ApiErrors
  extend ActiveSupport::Concern

  included do

    rescue_from ActionController::ParameterMissing, with: :standardize_parameter_missing_error_response
    private def standardize_parameter_missing_error_response(error)
      render json: {
                     error: {
                       message: "A required parameter was missing.",
                       messages: {
                         base: [error.message]
                       }
                     }
                   },
              status: 400
      return false
    end

    rescue_from Api::V3::BadRequestError, with: :standardize_bad_request_error_response
    private def standardize_bad_request_error_response(error)
      render json: {
                    error: {
                      message: "Invalid request",
                      messages: {
                        base: [error.message]
                      }
                    }
                  },
              status: 400
      return false
    end

    rescue_from Api::V3::UnauthenticatedError, with: :standardize_unauthenticated_error_response
    private def standardize_unauthenticated_error_response(error)
      render json: {
                     error: {
                       message: "You are not authenticated.",
                       messages: {
                         base: [error.message]
                       }
                     }
                   },
              status: 401
      return false
    end

    rescue_from Api::V3::GenericApiError, with: :standardize_generic_api_error_response
    private def standardize_generic_api_error_response(error)
      render json: {
                    error: {
                      message: error.message,
                      messages: error.messages
                    }
                  },
              status: error.status_code
      return false
    end

    rescue_from ::Pundit::NotAuthorizedError, ::Pundit::NotDefinedError, with: :standardize_unauthorized_error_response
    private def standardize_unauthorized_error_response(error)
      render json: {
                     error: {
                       message: "You are not authorized to perform this action.",
                       messages: {
                         base: [params[:controller], params[:action]]
                       }
                     }
                   },
              status: 403
      return false
    end

    rescue_from ActiveRecord::RecordInvalid, with: :standardize_record_invalid_error_response
    private def standardize_record_invalid_error_response(error)
      render json: {
                     error: {
                       message: "Sorry, an error occurred.",
                       messages: @resource.errors.messages
                     }
                   },
              status: 422
      return false
    end

    rescue_from ActiveRecord::RecordNotFound, with: :standardize_record_not_found_error_response
    private def standardize_record_not_found_error_response(error)
      render json: {
                     error: {
                       message: "The record was not found.",
                       messages: {
                         base: [error.message]
                       }
                     }
                   },
              status: 404
      return false
    end

    rescue_from Api::V3::Errors::WepayApiError, with: :standardize_wepay_api_error_response
    private def standardize_wepay_api_error_response(error)
      render json: {
                    error: {
                      message: error.message,
                      code: error.code
                    }
                  },
              status: 422
      return false
    end
  end
end
