class UsersController < ApplicationController
  require 'json_web_token'
  before_action :authenticate_request!, only: [:show, :index, :update]
  def login
    user = User.find_by(email: login_params[:email].to_s.downcase)
    if user && user.authenticate(login_params[:password])
      if user.confirmed_at?
        auth_token = JsonWebToken.encode({user_id: user.id})
        render json: {auth_token: auth_token}, status: :ok
      else
        render json: {error: 'Email not verified' }, status: :unauthorized
      end
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end

  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user).serialized_json
  end

  def index
    users = User.all
    render json: UserSerializer.new(users).serialized_json
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: {status: 'User created successfully'}, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    User.find(params[:id]).update_attributes(update_params)
  end

  def confirm
    token = confirmation_params[:token].to_s

    user = User.find_by(confirmation_token: token)

    if user.present? && user.confirmation_token_valid?
      user.mark_as_confirmed!
      render json: {status: 'User confirmed successfully'}, status: :ok
    else
      render json: {status: 'Invalid token'}, status: :not_found
    end
  end

  private def user_params
    params.require(:data).require(:attributes)
      .permit(:first_name,
              :last_name,
              :email,
              :username,
              :password,
              :password_confirmation)
  end

  private def login_params
    params.require(:data).require(:attributes)
      .permit(:email, :username, :password)
  end

  private def confirmation_params
    params.require(:data).require(:attributes)
      .permit(:token)
  end
end
