class Admin::SettingsController < Admin::SecureController
  # GET /settings
  # GET /settings.xml
  def index
    @setting = Setting.find(:first)
  end


  # PUT /settings/1
  # PUT /settings/1.xml
  def update
    @setting = Setting.find(:first)

    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        flash[:notice] = 'Setting was successfully updated.'
        format.html { render :action => "index" }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @setting.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def coupons
    @coupons = Coupon.find(:all)
  end
  
  def products
    @products = Product.find(:all)
  end
  
  def new_products
    @product = Product.new
  end
  
  def create_new_products
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        flash[:notice] = 'Product was successfully created.'
        format.html { render :action => "products" }
      else
        format.html { render :action => "new_products" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end


end
