class CreateTaskLists < ActiveRecord::Migration
  def change
    create_table :task_lists do |t|
      t.string :title
      t.boolean :archived, :default => false, null: false
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
