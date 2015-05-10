require 'rails_helper'

RSpec.describe "authorized users delete a list", type: :feature do 

  def user_logs_in
    visit '/'
    fill_in("session[username]", with: "Jim" )
    fill_in("session[password]", with: "password" )
    click_on 'Login'
  end

  xit "can delete a task list from the archived lists" do
    user = User.create!(  username: "Jim", password: "password",
                          display_name: "jimbo", 
                          email: "jim@example.com")
    user_logs_in
    click_on "Create A New Task List"
    task_list = TaskList.create!( title: "Skydiving", archived: true,
                            user_id: user.id)

    fill_in("task_list[title]", with: "Skydiving" )
    check "Archived"
    click_on "Add"

    within('tbody tr:nth-child(1) #archived') do
    save_and_open_page
      click_on "Delete"
    end
    expect(page).not_to have_content("Skydiving")
  end

end