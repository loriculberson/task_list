class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in!"
      redirect_to task_lists_path
    else
      flash[:errors] = "Invalid login. Please try again."
      redirect_to :back
    end
  end
end
