class TaskMailer < ApplicationMailer
  default from: "bigskybandit@sbcglobal.net"

  def create(email, task)
    @task = task
    @email = email
    
    mail(to: email, subject: task.title) 
  end
end
