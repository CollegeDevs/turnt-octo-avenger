class RemoveFromProject < ActiveRecord::Migration
  def change
  	remove_column :projects, :user_key, :string
  end
end
