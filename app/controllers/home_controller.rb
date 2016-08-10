class HomeController < ApplicationController
  
  def index
    @posts = Post.all
 
  end
  def index2
  end
  
  def about
  
  end
  
  def write_post

  end
  
  def form
  
  end
  
  def contact
    
  end
  
  def post_write
    
    post = Post.new
    uploader = SleepyUploader.new
    uploader.store!(params[:pic])
    post.title = params[:title]
    post.content = params[:content]
    post.image_url = uploader.url
    post.save
    
    redirect_to "/home/index"

  end
  
  def project_single
  end
    
end
