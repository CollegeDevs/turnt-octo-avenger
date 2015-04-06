class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.boolean :make_public

      t.timestamps null: false
    end
  end
end
