class UsersController < ApplicationController
  def index

  end

  def new
  end

  def create
    @user= User.create(user_params)
    if @user.valid?
      session[:user_id]=@user.id
      redirect_to events_path
    end
  end

  def update
    @user=User.find(session[:user_id])
    @user.update(user_params)
  end

  def show
    @user=User.find(session[:user_id])
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :state, :location, :email, :password, :password_confirmation)
    end
end
