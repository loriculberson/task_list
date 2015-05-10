require 'rails_helper'

RSpec.describe TaskList, type: :model do

  context "task_list with valid attributes" do

    it "is valid with all attributes" do
      list = create(:task_list)
      expect(list).to be_valid
    end
   
    it "is valid with a false value for archived status" do
      list = TaskList.create(title: "Swim lessons", archived: false, user_id: 2)
      expect(list).to be_valid
    end

    it "is valid with a true value for archived status" do
      list = TaskList.create(title: "Swim lessons", archived: true, user_id: 2)
      expect(list).to be_valid
    end

    it "is valid with a default value for archived status" do
      list = TaskList.create(title: "Swim lessons", user_id: 2)
      expect(list).to be_valid
    end

  end

  context "task_list without valid attributes" do

    it "is not valid without a title" do
      list = TaskList.create(title: nil)
      expect(list).not_to be_valid
    end

    it "is not valid without a user id" do
      list = TaskList.create(title: "Swim lessons", archived: true, user_id: nil)
      expect(list).not_to be_valid
    end
  end
end
