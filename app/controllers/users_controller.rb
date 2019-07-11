class UsersController < ActionController::API
  def show
    render json: User.find(params[:id])
  end

  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user.as_json( except: [:password_digest] )
    end
  end

  def update
    User.find(params[:id]).update_attributes(update_params)
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
end
