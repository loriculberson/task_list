require 'rails_helper'

RSpec.describe "authorized users", type: :feature do 

  def user_logs_in
    visit '/'
    fill_in("session[username]", with: "mel" )
    fill_in("session[password]", with: "password" )
    click_on 'Login'
  end

  it "can add a new task to a task list" do
    user = User.create!(username: "mel", email: "mel@example.com", 
                        display_name: "Melly Mel", password: "password")
    user_logs_in
    task_list = TaskList.create!(title: "Summer vacations", user_id: user.id)
    visit new_task_list_task_path(task_list.id) 
    
    fill_in "task[title]", with: "Camping"
    fill_in "task[description]", with: "visit some campground"
    fill_in "task[due_date]", with: "2015-05-10"
    click_on "Add Task"

    expect(page).to have_content("Camping")
    expect(page).to have_content("visit some campground")
    expect(page).to have_content("2015-05-10")
  end

end
