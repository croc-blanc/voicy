class RemoveColumnTypeOfProject < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :type
  end
end
