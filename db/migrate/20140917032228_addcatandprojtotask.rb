class Addcatandprojtotask < ActiveRecord::Migration
  def up
    add_column :tasks, :category_id, :integer
    add_column :tasks, :project_id, :integer
  end

  def down
  end
end
