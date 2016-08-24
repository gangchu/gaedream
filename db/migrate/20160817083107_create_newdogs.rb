class CreateNewdogs < ActiveRecord::Migration
  def change
    create_table :newdogs do |t|
        
        t.integer :user_id #주인아이디
        t.string :pet_subject #강아지업로드 게시판 제목
        t.string :name #강아지이름
        t.string :residence #거주지
        t.string :kind #종류
        t.string :age #나이
        t.string :sex #성별
        t.string :detail #세부사항
        t.string :image_url #사진주소
      
      t.timestamps null: false
    end
  end
end
