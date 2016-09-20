class HomeController < ApplicationController
  
  def index
    # @posts = Post.all
    @users = User.all
    @every_pet = Newdog.search(params[:petsearch])
    
  end
  
  def index2
  end
  
  def about
  
  end
  
  def form
  
  end
  

  def question
    
    @questions = Post.all
    # .order("id desc")
    
  end
  
  def write_question # 글 저장하기
    if params[:id] == nil # 새글 저장
      post = Post.new
    else                  # 수정 저장
      post = Post.find(params[:id])
    end
    post.title    = params[:title]
    post.content  = params[:content]
    post.user_id  = current_user.id
    post.writer   = current_user.name
    
    if post.save
      if params[:id] == nil                       # 새 글 저장하는 경우에 보내는 곳은?
        redirect_to "/home/question"              # => 목록 페이지
      else                                        # 아니면 (수정 저장하는 경우에 보내는 곳은?)
        redirect_to "/home/questions/#{post.id}"  # => 수정된 글 페이지
      end
    else
      render :text => post.errors.messages[:content].first
    end
  end
  
  
  # def question_rewrite # 수정된 글 저장하기
  #   @sellected_question = Post.find(params[:id])
  #   @sellected_question.title = params[:title]
  #   @sellected_question.content = params[:content]
  #   @sellected_question.save
    
  #   redirect_to :back
  # end
  
  def question_destroy
    trash = Post.find(params[:id])
    trash.delete
    redirect_to "/home/question"
  end
  
  
  def show_questions
    @sellected_question = Post.find(params[:id])
    
  end
  
  def question_write
    unless params[:id] == nil
      @question = Post.find(params[:id])
    end
  end
  
  
  def pet_upload
    
    new_pet = Newdog.new
    new_pet.pet_subject = params[:pet_subject]
    new_pet.name = params[:name]
    new_pet.residence = params[:residence]
    new_pet.kind = params[:kind]
    new_pet.age = params[:age]
    new_pet.sex = params[:sex]
    new_pet.detail = params[:detail]
    new_pet.user = current_user
    uploader = SleepyUploader.new
    file = params[:pic]
    uploader.store!(file)
    new_pet.image_url = uploader.thumb.url
    new_pet.save
   
    redirect_to "/list"

  end
  
  def update_pet
    @one_pet = Newdog.find(params[:id])
    @one_pet.pet_subject = params[:pet_subject]
    @one_pet.name = params[:name]
    @one_pet.residence = params[:residence]
    @one_pet.kind = params[:kind]
    @one_pet.age = params[:age]
    @one_pet.sex = params[:sex]
    @one_pet.detail = params[:detail]
    
    @one_pet.save
    
    redirect_to '/list'
    
  end
  
  def update_pet_view
    @one_pet = Newdog.find(params[:id])
  enddef update_pet
    @one_pet = Newdog.find(params[:id])
    @one_pet.pet_subject = params[:pet_subject]
    @one_pet.name = params[:name]
    @one_pet.residence = params[:residence]
    @one_pet.kind = params[:kind]
    @one_pet.age = params[:age]
    @one_pet.sex = params[:sex]
    @one_pet.detail = params[:detail]
    
    @one_pet.save
    
    redirect_to '/list'
    
  end
  
  def update_pet_view
    @one_pet = Newdog.find(params[:id])
  end
  
  def pet_content
    @one_pet = Newdog.find(params[:id])
    @newdogs = Newdog.all
  end
  
  def writenewdogreply
    Newdogreply.create(newdog_id: params[:id_of_newdog], content: params[:content], writer: current_user.name)
    redirect_to :back
  end
  
  def delete_pet
    @one_pet = Newdog.find(params[:id])
    @one_pet.destroy
    redirect_to "/list"
  end
  
  
  
  
  def list
    @every_pet = Newdog.all
        @users = User.all
  end
  
  def project_single
  end
  
  def matching_view
     
     @kind = Newdog.uniq.pluck(:kind)
     @age = Newdog.uniq.pluck(:age)
     @sex = Newdog.uniq.pluck(:sex)
     @residence = Newdog.uniq.pluck(:residence)
     
  end
  
  def matching
      @matching_pet = Newdog.pet_find(params[:kind],params[:age],params[:sex],params[:residence])
  end
  
  def my_pages
  end
  
  def message_recieved_box #받은 쪽지함
    @messages = Message.where(user_id: current_user.id).all
  end
  
  def message_create #메시지 생성
    Message.create(check: false, user_id: params[:recipient], title: params[:title], content: params[:content], sender_id: current_user.id, writer: current_user.name)
    redirect_to "/home/index"
  end
  
  def message_new #메시지 쓰기
    @touser = User.where(id: params[:id]).take
  end
  
  def message_show # 쪽지함에서 메시지 보여주기
    @user = User.where(id: params[:id]).take
  end
  
  def show_content #내용show
    @messages = Message.where(id: params[:id]).take
    @messages.check = true
    @messages.save
  end
  
  def infomation
  end
end


