class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :type
      t.date :begin
      t.date :end
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
