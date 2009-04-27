module JobsHelper
	
	def new_job (job)
		if job.product.members <= job.participants.count or job.status != "Active" or job.user_id == session[:user_id] or job.participants.find_by_user_id(session[:user_id])
			false	
		else
			true	
		end
	end
end
