class CreateNewdogreplies < ActiveRecord::Migration
  def change
    create_table :newdogreplies do |t|
        t.string :title
        t.text :content
        t.integer :newdog_id
        t.string :writer
      t.timestamps null: false
    end
  end
end
