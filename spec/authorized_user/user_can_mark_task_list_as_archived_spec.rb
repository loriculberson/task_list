require 'rails_helper'

RSpec.describe "authorized users", type: :feature do 

  def user_logs_in
    user = User.create( username: "Sam", display_name: "Sammie", 
                        password: "password", email: "sam@example.com")
    visit '/'
    fill_in("session[username]", with: "Sam" )
    fill_in("session[password]", with: "password" )
    click_on 'Login'
  end

  it "can mark a list as archived and it does not appear on the index page" do
    user_logs_in

    task_list = FactoryGirl.create(:task_list)
    
    click_on "Create A New Task List"
    fill_in("task_list[title]", with: "Plan vacation" )
    check 'Archived'
    click_on "Add List"
    expect(page).not_to have_content("Plan vacation")
  end

  it "can leave archived blank it does appear on the index page" do
    user_logs_in
    
    task_list2 = TaskList.create(title: "Hello World")
    click_on "Create A New Task List"
    fill_in("task_list[title]", with: "Hello World" )
    click_on "Add List"
    expect(page).to have_content("Hello World")
  end
end