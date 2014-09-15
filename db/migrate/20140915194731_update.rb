class Update < ActiveRecord::Migration
  def up
    add_column :tasks, :email, :string
  end

  def down
    delete_column :tasks, :user_id
  end
end
