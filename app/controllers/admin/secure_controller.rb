class Admin::SecureController < ApplicationController
	
	before_filter :startup, :except => :login
	before_filter :authorize, :except => :login


private
  def startup
		@current_user = User.find_by_id(session[:user_id])  	
		@settings = Setting.find(:first)  	
  end
  def authorize
		unless User.find_by_id(session[:user_id]).admin
			render :template => "admin/secure/authorize"
			#format.html {render :template => "weblog/show"} # index.html.erb
		end
	end

end
