FactoryGirl.define do

  factory :task_list do
    user

    title "Plan vacation"
    archived false
  end

end
