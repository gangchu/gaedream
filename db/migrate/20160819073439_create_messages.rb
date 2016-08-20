class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
        t.string :title #메시지 주소
        t.text :content #메시지 내용
        t.string :writer #글쓴이
        t.integer :user_id #어떤유저에게 보낼지
      t.timestamps null: false
    end
  end
end
