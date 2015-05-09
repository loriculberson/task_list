require 'rails_helper'

RSpec.describe "new user can create account", type: :feature do  

  it "sees the sign up link on the homepage" do
    visit root_path
    expect(page).to have_content("Sign Up")
  end


end
