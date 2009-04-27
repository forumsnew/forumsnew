class ProfileController < ApplicationController
  def index
  	@user = User.find_by_id(session[:user_id])
  end
  
  def update
    @user = User.find(session[:user_id])
    @user.admin = false
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Profile was successfully updated.'
        format.html { render :action => "index" }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
