require 'rails_helper'
require 'support/factory_girl'

RSpec.describe User, type: :model do

  it "is valid with all attributes" do
    user = create(:user)
    expect(user).to be_valid   
  end

  it "is not valid without a username" do
    user = User.create( username: nil, display_name: "Bubba",
                        password: "password", 
                        email: "bubba@example.com")
    expect(user).not_to be_valid   
  end

  it "is not valid without a password" do
    user = User.create( username: "happy44", display_name: "Bubba",
                        password: nil, 
                        email: "bubba@example.com")
    expect(user).not_to be_valid   
  end

  it "is not valid without a email" do
    user = User.create( username: "happy44", display_name: "Bubba",
                        password: "password", 
                        email: nil)
    expect(user).not_to be_valid   
  end

  it "can have a unique username" do
    user = create(:user)
    user2 = User.create( username: "bubba", display_name: "Bubba",
                        password: "password", 
                        email: "bubba@example.com")
    expect(user2).not_to be_valid   
  end

  it "can have a unique email" do
    user = create(:user)
    user2 = User.create( username: "sam", display_name: "Bubba",
                        password: "password", 
                        email: "bob@example.com")
    expect(user2).not_to be_valid   
  end

end
