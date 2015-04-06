class AddcolumnTotables < ActiveRecord::Migration
  def change
  	add_column :boards, :owner_id, :integer
  	add_column :projects, :owner_id,:integer
  	remove_column :boards, :user_id, :integer
  	remove_column :projects, :user_id, :integer
  end
end
