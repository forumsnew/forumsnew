class Admin::TransactionsController < Admin::SecureController
  def index
    @transactions = OrderTransaction.paginate :page => params[:page], :per_page => '10'  

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  def masspay
    @transactions = OrderTransaction.paginate :page => params[:page], :per_page => '10'  

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
   def refunds
    @transactions = OrderTransaction.paginate :page => params[:page], :per_page => '10'  

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

end
