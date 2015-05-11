require 'rails_helper'

RSpec.describe "authorized users", type: :feature do 

  def user_logs_in
    user = FactoryGirl.create(:user)
    visit '/'
    fill_in("session[username]", with: "bubba" )
    fill_in("session[password]", with: "password" )
    click_on 'Login'
  end

  it "can create a list" do
    user_logs_in
    click_on "Create A New Task List"

    expect(page).to have_content("Title")
    fill_in("task_list[title]", with: "Weekend Errands" )
    click_on "Add"
    expect(page).to have_content("Weekend Errands")
  end

  it "can edit the name of a task list" do
    user_logs_in
    user = User.last
    
    task_list = TaskList.create!(title: "Plan vacation", user_id: user.id)
    visit task_lists_path
    within('tbody tr:nth-child(1)') do
      click_on 'Edit'
    end
    fill_in("task_list[title]", with: "Weekend Errands" )
    click_on "Update"

    expect(page).to have_content("Weekend Errands")
    expect(page).not_to have_content("Plan vacation")
  end
end
