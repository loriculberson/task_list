class TaskList < ActiveRecord::Base
  validates :title, :user_id, presence: true
  belongs_to :user
  has_many :tasks
end

