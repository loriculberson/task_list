require 'rails_helper'

RSpec.describe "new user can create account", type: :feature do  


  it "sees the sign up link on the homepage" do
    visit '/'
    expect(page).to have_content("Sign Up")
  end

  it "can see form for registration" do
    visit '/'
    click_link "Sign Up"

    expect(page).to have_button("Create Account")
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")

    expect(page).not_to have_content("first_name")
  end

  it "can create an account" do
    visit '/'
    click_link "Sign Up"
    fill_in("user[username]", with: "buttercup" )
    fill_in("user[display_name]", with: "rockstar" )
    fill_in("user[email]", with: "happy@example.com" )
    fill_in("user[password]", with: "password" )
    fill_in("user[password_confirmation]", with: "password" )
    click_button "Create Account"

    expect(page).to have_content("Account created!")
    expect(page).to have_content("Task Lists")
  end
end
