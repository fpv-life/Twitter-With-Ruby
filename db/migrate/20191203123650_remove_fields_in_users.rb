class RemoveFieldsInUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :joined_date, :date, null: false
    remove_column :users, :avatar, :string, null: false
  end
end
