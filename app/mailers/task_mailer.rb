class TaskMailer < ApplicationMailer
  default from: "bigskybandit@sbcglobal.net"

  def create(email, task)
    @task = task
    @email = email
    
    render layout: 'task_email' 
    mail(to: email, subject: task.title) 
  end
end
