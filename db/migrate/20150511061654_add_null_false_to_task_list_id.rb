class AddNullFalseToTaskListId < ActiveRecord::Migration
  def change
      change_table :tasks do |t|
        t.change :task_list_id, :integer, null: false
      end
  end
end
