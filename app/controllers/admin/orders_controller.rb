class Admin::OrdersController < ApplicationController
  # GET /orders
  # GET /orders.xml
  def index
    @orders = Order.paginate :page => params[:page], :per_page => User.find_by_id(session[:user_id]).rows

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end
  
   def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end
  
 def writers
    @order = Order.find(params[:id])
    @posts = Order.find(params[:id]).posts.all
    @participants = Order.find(params[:id]).participants.all
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end
  
  def posts
    @order = Order.find(params[:id])
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
  @order.ip_address = request.remote_ip
  @order.user_id = session[:user_id]
  if @order.save
    if @order.purchase
      render :action => 'index'
    else
    	#flash[:notice] = "<p>Unfortunately, your credit card transaction could not be processed.Authorization for funds may appear on your credit card account, but the transaction was declined and no funds were collected.</p>"
    	#render :action => 'new'
    	render :action => "failure"
    end
  else
    render :action => 'new'
  end
end


end
