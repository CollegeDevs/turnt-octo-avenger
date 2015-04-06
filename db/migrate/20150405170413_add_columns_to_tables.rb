class AddColumnsToTables < ActiveRecord::Migration
  def change
  	add_column :projects, :user_id, :integer
  	add_column :projects, :due_date, :date
  	add_column :boards, :project_id, :integer
  	add_column :boards, :user_id, :integer
  	add_column :users,:username, :string
  	add_column :users, :name, :string	
  end
end
