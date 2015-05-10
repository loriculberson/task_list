class TaskList < ActiveRecord::Base
  validates :title, :user_id, presence: true
  validates :title, uniqueness: true
  belongs_to :user
end

