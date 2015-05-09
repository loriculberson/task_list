class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    redirect_to task_lists_path
  end
end
