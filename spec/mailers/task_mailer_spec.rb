require "rails_helper"

RSpec.describe TaskMailer, type: :mailer do

  it "sends an email when a task subject has /cc and email address" do

    task = Task.create!(title: "/cc peter@example.com", description: "description",
                        task_list_id: 1, due_date: "2015-05-10")

    email = "bigskybandit@sbcglobal.net"

    TaskMailer.create(email, task).deliver
    result = ActionMailer::Base.deliveries.last

    expect(result).not_to be_nil
    expect(result.to).to include "bigskybandit@sbcglobal.net"
    expect(result.from).to include "bigskybandit@sbcglobal.net"
    expect(result.subject).to eq "#{task.title}"
  end
end
