class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save!
      flash[:success] = "Account created!"
      redirect_to task_lists_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit( :username, :email, 
                                  :password, :display_name)
  end
end
