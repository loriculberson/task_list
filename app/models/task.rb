class Task < ActiveRecord::Base
  validates :title, :description, :task_list_id, 
            :due_date, presence: true
  belongs_to :task_list
end
