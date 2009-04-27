class Order < ActiveRecord::Base
	
	has_many :participants
  has_many :users, :through => :participants
	
  attr_accessor :card_number, :card_verification
  has_many :transactions, :class_name => "OrderTransaction"
  belongs_to :product
	belongs_to :coupon
	has_many :posts
	
	belongs_to  :user
  
  validate_on_create :validate_card
  validates_presence_of :forum_title, :forum_url
  
  def purchase
    response = process_purchase 
    transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
    response.success?
  end
  
  def price_in_cents
		#initial_price = 10.00 # get initial price
		initial_price = Product.find(product_id).price
		logger.error( initial_price )
   if coupon && coupon.active?
     initial_price - coupon.discount(initial_price)
   else
     initial_price
   end
  end
  
  
  
  def express_token=(token)
  write_attribute(:express_token, token)
  if new_record? && !token.blank?
    details = EXPRESS_GATEWAY.details_for(token)
    self.express_payer_id = details.payer_id
  end
end

  
  def coupon_code=(code)
    self.coupon = Coupon.find_by_code(code)
	end
	
	def coupon_code
		coupon.code unless coupon.nil?
	end

  private
  
  def process_purchase
  if express_token.blank?
    GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
  else
    EXPRESS_GATEWAY.purchase(price_in_cents, express_purchase_options)
  end
end

  def express_purchase_options
  {
    :ip => ip_address,
    :token => express_token,
    :payer_id => express_payer_id
  }
end

	
  
  def purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => "Ryan Bates",
        :address1 => "123 Main St.",
        :city     => "New York",
        :state    => "NY",
        :country  => "US",
        :zip      => "10001"
      }
    }
  end
  
  def validate_card
    if express_token.blank? && !credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add_to_base message
      end
    end
  end
  
  def credit_card
  	 
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => card_type,
      :number             => card_number,
      :verification_value => card_verification,
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => "James",
      :last_name          => "Brown"
    )
  end
  
end
