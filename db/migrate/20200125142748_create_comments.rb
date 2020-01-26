class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :reply
      t.date :posted

      t.timestamps
    end
  end
end
