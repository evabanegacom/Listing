class Api::V1::UsersController < ApplicationController
  before_action :authorized, only: %i[auto_login]

  def index
    @users = User.all
    #render json: @users, status: 200
    response.headers["item_count"] = @users.count
    paginate json: @users
    #http://localhost:3001/api/v1/users?per_page=2&page=3
  end
  # REGISTER

  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: 200
    else
      render json: { error: 'Invalid name or password' }, status: 404
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token, loggedIn: true, error: nil }, status: 200
    else
      render json: { error: 'Invalid name or password', loggedIn: false }, status: 404
    end
  end

  def auto_login
    @user = User.find_by(email: params[:email])
    render json: { user: @user, loggedIn: true }
  end

  private

  def user_params
    params.permit(:name, :password, :password_confirmation, :email, :location, :phone, :state)
  end
end