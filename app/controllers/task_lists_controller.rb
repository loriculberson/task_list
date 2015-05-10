class TaskListsController < ApplicationController
  
  def index
    @archived = current_user.task_lists.where(archived:true)
    @unarchived = current_user.task_lists.where(archived:false)
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

  def destroy
    @task_list = TaskList.find(params[:id])
    @task_list.destroy
    redirect_to task_lists_path
    flash[:warning] = "Bye bye #{@task_list.title}!"

  end

  private
  def task_list_params
    params.require(:task_list).permit(:title, :archived)
  end
end
