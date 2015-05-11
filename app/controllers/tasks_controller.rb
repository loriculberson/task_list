class TasksController < ApplicationController

  def index
    tasks = Task.where(task_list_id: params[:id])
    @incomplete = tasks.where(completed: false)
    @completed = tasks.where(completed: true)
    # task_list = TaskList.find(params[:id])
    # @incomplete = task_list.tasks.where(completed:false)
  end

  def new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "New task created!"
      redirect_to task_list_tasks_path
    else
      render :new 
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "Task updated!"
      redirect_to task_list_tasks_path
    else
      flash[:warning] = "Oops! Try again."
      redirect_to :back
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :completed, :description, :due_date)
  end
end
