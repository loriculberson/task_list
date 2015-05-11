class TasksController < ApplicationController

  def index
    # tasks = Task.where(task_list_id: params[:id])
    task_list   = TaskList.find(params[:task_list_id])
    @incomplete = task_list.tasks.where(completed:false)
    @completed  = task_list.tasks.where(completed: true)
  end

  def new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    task_list = TaskList.find(params[:task_list_id])
    @task = task_list.tasks.new(task_params)

    if @task.save 
      email_to_match_data_or_nil = @task.title.match(/\/cc (.+)/)
      if email_to_match_data_or_nil.present?
        email = email_to_match_data_or_nil[0]
        TaskMailer.task_info_email(email, @task).deliver
      end
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
