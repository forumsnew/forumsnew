class JobsController < ApplicationController
  def index
  	@participants = User.find(session[:user_id]).participants
  end

  def show
  	@job = User.find(session[:user_id]).participants.find_by_order_id(params[:id])
  end

  def apply
  	if !Participant.find_by_user_id_and_order_id(session[:user_id], params[:id])
  		Participant.create(:user_id => session[:user_id], :order_id => params[:id], :removed => "0")	
		end
  	
  	redirect_to(:action => :index)
  end
  
   def new
   	@orders = Order.all
  end
  
def posts
   	@job = User.find(session[:user_id]).participants.find_by_order_id(params[:id])
   	@my_posts = User.find(session[:user_id]).participants.find_by_order_id(params[:id]).order(params[:id]).posts
   	
  end


	def new_post
   	@job = User.find(session[:user_id]).participants.find_by_order_id(params[:id])
  end
  
  def create_post
    @post = Post.new(params[:post])
    @post.user_id = session[:user_id]
    
    
    if @post.save
    	
    	@user = User.find(session[:user_id])
    	@user.payment += @user.per_post
    	@user.save
    	
    	redirect_to(:action => "posts", :id => @post.order_id)
    end

   
  end
  

end
