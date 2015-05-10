class User < ActiveRecord::Base
  validates :username, :password, :email, :display_name, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  has_many :task_lists

  has_secure_password

end
