class Newdog < ActiveRecord::Base
    has_many :newdogreplies
    belongs_to :user
    
     def self.search(petsearch)
        if petsearch
             where("kind LIKE ?", petsearch )
        
        else
           all
        end

    end
    
    def self.pet_find(kind,age,sex,residence)
        if kind && age && sex && residence
             where("kind LIKE ?", kind ).where("age LIKE ?", age ).where("sex LIKE ?", sex ).where("residence LIKE ?", residence )
        elsif kind || age || sex || residence
         
            if age.nil? && sex.nil? &&residence.nil? #하나씩만 선택하는 경우
                where("kind LIKE ?", kind )
            elsif kind.nil? && sex.nil? && residence.nil?
                where("age LIKE ?", age )
            elsif kind.nil? && age.nil? && residence.nil?
                where("sex LIKE ?", sex )
            elsif kind.nil? && age.nil? && sex.nil?
                where("residence LIKE ?", residence )
            elsif sex.nil? && residence.nil? #두개씩 선택하는경우
                where("kind LIKE ?", kind ).where("age LIKE ?", age )
            elsif age.nil? && residence.nil?
                where("kind LIKE ?", kind ).where("sex LIKE ?", sex )
            elsif age.nil? && sex.nil?
                where("kind LIKE ?", kind ).where("residence LIKE ?", residence )
            elsif kind.nil? && residence.nil?
                where("age LIKE ?", age ).where("sex LIKE ?", sex )
            elsif kind.nil? && age.nil?
                where("sex LIKE ?", sex ).where("residence LIKE ?", residence )
            elsif kind.nil? && sex.nil?
                where("age LIKE ?", age ).where("residence LIKE ?", residence )
            elsif residence.nil? #3개씩 선택하는 경우
                where("kind LIKE ?", kind ).where("age LIKE ?", age ).where("sex LIKE ?", sex )
            elsif age.nil?
                where("kind LIKE ?", kind ).where("sex LIKE ?", sex ).where("residence LIKE ?", residence )
            elsif sex.nil?
                where("kind LIKE ?", kind ).where("age LIKE ?", age ).where("sex LIKE ?", residence )
            elsif kind.nil?
                where("age LIKE ?", age ).where("sex LIKE ?", sex ).where("residence LIKE ?", residence )
            end
        else
            all
        end
    end
end
