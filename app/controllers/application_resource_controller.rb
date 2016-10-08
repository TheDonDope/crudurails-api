class ApplicationResourceController < JSONAPI::ResourceController
  # We depend on our auth_token module here.
  require 'auth_token'

  # No action on this controller is accessible without a supplying a valid token
  before_action :verify_jwt_token

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session, prepend: true

  protected

    ##
    # This method can be used as a before filter to protect
    # any actions by ensuring the request is transmitting a
    # valid JWT.
    def verify_jwt_token
      head :unauthorized if request.headers['Authorization'].nil? ||
          !AuthToken.valid?(request.headers['Authorization'].split(' ').last)
    end
end
