class AdminController < ApplicationController
  def index
  	@latest_jobs = Order.all(:limit => 5)
  	@flagged_posts = Post.count
  end

end
