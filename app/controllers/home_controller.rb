class HomeController < ApplicationController
  
  def index
    @posts = Post.all
    @users = User.all
    @every_pet = Newdog.all
 
  end
  def index2
  end
  
  def about
  
  end
  
  def form
  
  end
  
  def contact
    
  end
  
  
  def pet_upload
    
    new_pet = Newdog.new
    new_pet.pet_subject = params[:pet_subject]
    new_pet.name = params[:name]
    new_pet.residence = params[:residence]
    new_pet.type = params[:type]
    new_pet.age = params[:age]
    new_pet.sex = params[:sex]
    new_pet.detail = params[:detail]
    
    uploader = SleepyUploader.new
    file = params[:pic]
    uploader.store!(file)
    new_pet.image_url = uploader.thumb.url
    new_pet.save
   
    redirect_to "/list"

  end
  
  def list
    @every_pet = Newdog.all
  end
  
  def project_single
  end
  
  def matching
  end
  
  def my_pages
  end
  
  def message_recieved_box #받은 쪽지함
    @messages = Message.where(user_id: current_user.id).all
  end
  
  def message_create #메시지 생성
    Message.create(user_id: params[:recipient], title: params[:title], content: params[:content], writer: current_user.name)
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
  end
  
  def infomation
  end
end