class UsersController < ApplicationController

  def login
    user_password = params[:password]
    username = params[:username]
    # checks email and password to authenticate user
    if (user = User.find_by(username: username).try(:authenticate, user_password))
      # generate tokens only if temp_password is not present
      user.generate_auth_token
      render json: user, status: 200
    else
      render json: {error: "Incorrect user id or password"}, status: 422
    end
  end

  def create
    user = User.new()
    user.username = params['username']
    user.password = params['password']
    if user.save
      render json: user, status: 200
    else
      render json: user.errors, status: 422
    end
  end


  private
  def user_params
    params.permit(:username, :password)
  end
end