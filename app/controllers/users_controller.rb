class UsersController < ActionController::API
  def show
    render json: User.find(params[:id])
  end

  def index
    render
  end

  def create

  end

  def new

  end

  def edit

  end

  def update

  end
end
