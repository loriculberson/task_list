class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.date :due_date
      t.boolean :completed, :default => false, null: false
      t.integer :task_list_id

      t.timestamps null: false
    end
  end
end
