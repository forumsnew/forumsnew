class RatingController < ApplicationController
  def rate
    @user = User.find(params[:id])
    Rating.delete_all(["rateable_type = 'User' AND rateable_id = ? AND user_id = ?", 
      @user.id, @current_user.id])
    @user.add_rating Rating.new(:rating => params[:rating], 
      :user_id => @current_user.id)
  end


end
