class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :date
    add_column :users, :website, :string
    add_column :users, :role, :integer
    add_column :users, :gender, :integer
    add_column :users, :phone_number, :string
    add_column :users, :voice_attribute, :integer
    add_column :users, :description, :text
    add_column :users, :avaibility, :boolean
    add_column :users, :address, :string
    add_column :users, :zip_code, :string
    add_column :users, :city, :string
  end
end
