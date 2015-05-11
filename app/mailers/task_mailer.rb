class TaskMailer < ApplicationMailer
  default from: "yay@example.com"

  def task_info_email(email, task)
    @task = task
    @email = email
    mail(to: email, subject: task.title)
  end
end
