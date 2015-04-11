class AddSlugTotables < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true

    add_column :boards, :slug, :string
    add_index :boards, :slug, unique: true

    add_column :projects, :slug, :string
    add_index :projects, :slug, unique: true

    add_column :events, :slug, :string
    add_index :events, :slug, unique: true
  end
end
