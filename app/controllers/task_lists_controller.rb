class TaskListsController < ApplicationController
  
  def index
    @task_lists = current_user.task_lists
  end

  def new
    @task_list = current_user.task_lists.new
  end

  def create
    @task_list = current_user.task_lists.new(task_list_params)
    
    if @task_list.save
      flash[:success] = "New task list created!"
      redirect_to task_lists_path
    else
      flash[:warning] = "Task must have a title."
      render :new 
    end
  end

  def edit
    @task_list = TaskList.find(params[:id])
  end

  def update
    @task_list = TaskList.find(params[:id])
    if @task_list.update(task_list_params)
      flash[:success] = "List updated!"
      redirect_to task_lists_path
    else
      flash[:warning] = "Oops! Try again."
      redirect_to :back
    end
  end

  private
  def task_list_params
    params.require(:task_list).permit(:title, :archived)
  end
end
