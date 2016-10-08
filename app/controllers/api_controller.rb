#
# Class ApiController provides a generic api endpoint controller not bound to a
# specific resource.
#
# @author Don Dope <idontreallyneedthese@gmail.com>
#
class ApiController < ApplicationController
  # No action on this controller is accessible without a supplying a valid token
  before_filter :verify_jwt_token

  #
  # Renders a JSON success response when the user access the action with a valid
  # jwt token.
  #
  def authorized
    respond_to do |format|
      format.json { render json: { 'authorized' => true } }
    end
  end
end
