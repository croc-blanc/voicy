class ChangeColumnTypeOfProjectToKind < ActiveRecord::Migration[5.0]
  def change
    change_column :projects, :type, :kind
  end
end
