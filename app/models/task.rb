class Task < ActiveRecord::Base
  validates :title, :description,
            :due_date, presence: true
  belongs_to :task_list
end
