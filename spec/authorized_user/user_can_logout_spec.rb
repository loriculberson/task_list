require 'rails_helper'

RSpec.describe "authorized user", type: :feature do 

  def user_logs_in
    user = create(:user)
    visit '/'
    fill_in("session[username]", with: "bubba" )
    fill_in("session[password]", with: "password" )
    click_on 'Login'
  end

  it "can logout" do
    user_logs_in
    
    within('#logout') do
      click_on 'Logout'
    end 
    expect(page).to have_content("You've logged out!")
    expect(current_path).to eql(root_path)
  end
end