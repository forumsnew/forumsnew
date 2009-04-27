class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.xml
  def index
    @orders = Order.find_all_by_user_id(session[:user_id]).paginate :page => params[:page], :per_page => User.find_by_id(session[:user_id]).rows
    
    @current_user = User.find_by_id(session[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end
  
   def details
    @order = User.find(session[:user_id]).orders.find(params[:id])
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
      @order = Order.new(:express_token => params[:token], :coupon_code => params[:coupon_code])
		
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end
  
   def show
  
    @order = User.find(session[:user_id]).orders.find(params[:id])
    @posts = User.find(session[:user_id]).orders.find(params[:id]).posts.count(:conditions => "post_type = 'Post' AND flag = '0'")
    @threads = User.find(session[:user_id]).orders.find(params[:id]).posts.count(:conditions => "post_type = 'Thread' AND flag = '0'")
   
    @participants = User.find(session[:user_id]).orders.find(params[:id]).participants.count

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @order }
    end
  end
  
 def writers
    @order 				= User.find(session[:user_id]).orders.find(params[:id])
    @posts 				= User.find(session[:user_id]).orders.find(params[:id]).posts
    @participants = User.find(session[:user_id]).orders.find(params[:id]).participants
    

    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def posts
    @order = User.find(session[:user_id]).orders.find(params[:id])
    @posts = Order.find(params[:id]).posts.all
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # POST /orders
  # POST /orders.xml
  def create  	
  		
  @order = Order.new(params[:order])
  @order.coupon_code = params[:order][:coupon_code]
  @order.ip_address = request.remote_ip
  @order.user_id = session[:user_id]
  if @order.save
    if @order.purchase
      render :action => 'show'
    else
    	render :action => "failure"
    end
  else
    render :action => 'new'
  end
end

def express
  response = EXPRESS_GATEWAY.setup_purchase(495,
    :ip                => request.remote_ip,
    :return_url        => new_order_url,
    :cancel_return_url => products_url
  )
  redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
end



end
