class RemoveColumnFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :commentable_type, :string
    remove_column :comments,:commentable_id ,  :integer
    add_column :comments,:board_id, :integer
  end
end
