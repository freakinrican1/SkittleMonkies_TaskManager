class CreateJoinTable < ActiveRecord::Migration
  def up
    create_table :categories_tasks do |c|
      c.integer :category_id
      c.integer :task_id
    end
  end

  def down
    remove_column :categories_tasks, :id
  end
end
