class Admin::ClientsController < Admin::SecureController
  def index
    @users = User.paginate :page => params[:page], :per_page => User.find_by_id(session[:user_id]).rows

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  def show
  	@user = User.find(params[:id])
  	@latest_orders = Order.find_by_user_id(session[:user_id])
  	@latest_jobs = User.find(params[:id]).participants.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { render :action => "edit" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
