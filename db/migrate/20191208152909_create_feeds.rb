class CreateFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :feeds do |t|
      t.text :text
      t.string :picture
      t.timestamp :time
      t.string :reported

      t.timestamps
    end
  end
end
