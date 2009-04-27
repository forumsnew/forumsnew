class MyordersController < ApplicationController  
  
  def index
  @orders = Order.all
  end

end
