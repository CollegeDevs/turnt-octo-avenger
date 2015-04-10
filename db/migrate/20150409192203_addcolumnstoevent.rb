class Addcolumnstoevent < ActiveRecord::Migration
  def change
  	add_column :events, :project_id, :integer
  	add_column :events, :board_id, :integer
  end
end
