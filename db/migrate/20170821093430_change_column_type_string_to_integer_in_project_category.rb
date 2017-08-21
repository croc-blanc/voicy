class ChangeColumnTypeStringToIntegerInProjectCategory < ActiveRecord::Migration[5.0]
  def change
    change_column :projects, :category, 'integer USING CAST(category AS integer)'
  end
end
