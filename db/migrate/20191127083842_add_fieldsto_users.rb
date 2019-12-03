class AddFieldstoUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :joined_date, :date, null: false
    add_column :users, :born_date, :date
    add_column :users, :bio, :text
    add_column :users, :location, :string
    add_column :users, :avatar, :string, null: false
  end
end
