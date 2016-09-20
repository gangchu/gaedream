class Post < ActiveRecord::Base
    has_many :replies
    belongs_to :user
    
    validates :content, presence: {message: "내용없이 글을 등록할 수 없습니다"}
end
