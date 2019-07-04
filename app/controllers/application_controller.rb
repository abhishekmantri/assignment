class ApplicationController < ActionController::Base

  skip_before_action :verify_authenticity_token
  after_action :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end


  def current_user
    if request.headers['Authorization'].present?
      user = User.find_by(:auth_token => request.headers['Authorization']).as_json
      if user && user['auth_expiry_time'] > Time.now
        user
      else
        false
      end
    end
  end

  def authenticate_user
    if current_user
      true
    else
      render json: {error: 'Authorization required'}, status: 401
    end
  end

end
