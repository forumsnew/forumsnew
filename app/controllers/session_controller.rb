class SessionController < ApplicationController
  
	def login
		session[:user_id] = nil
		if request.post?
			user = User.authenticate(params[:email], params[:password])
			if user
				session[:user_id] = user.id
				uri = session[:original_uri]
				session[:original_uri] = nil
				if user.admin
					redirect_to(uri || { :controller=> "admin", :action => "index" })
				else
					redirect_to(uri || { :controller=> "index", :action => "index" })
				end
			else
				flash.now[:notice] = "Invalid email/password combination"
			end
		end
	end

  def logout
		session[:user_id] = nil
		flash[:notice] = "You have been successfully logged out"
		redirect_to(:action => "login" )
	end

end
