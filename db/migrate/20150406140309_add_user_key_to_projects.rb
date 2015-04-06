class AddUserKeyToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :user_key, :string
  end
end
