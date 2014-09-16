class PTJointable < ActiveRecord::Migration
  def up
    create_table :projects_tasks do |p|
      p.integer :project_id
      p.integer :task_id
    end
  end

  def down
    remove_column :projects_tasks, :id
  end
end
