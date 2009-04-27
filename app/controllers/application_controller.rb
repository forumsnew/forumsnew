# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
	before_filter :authorize, :except => :login
	before_filter :startup, :except => :login
	
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  #user = User.find_by_id(session[:user_id])
  private
  def startup
		@current_user = User.find_by_id(session[:user_id])  	
		@settings = Setting.find(:first)  	
  end
  
  def authorize
		unless User.find_by_id(session[:user_id])
			session[:original_uri] = request.request_uri
			flash[:notice] = "To begin, please enter your email & password"
			redirect_to(:controller => "session" , :action => "login" )
		end
	end
end
