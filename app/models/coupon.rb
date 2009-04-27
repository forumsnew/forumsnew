class Coupon < ActiveRecord::Base
	has_many :orders
	belongs_to :product
	
	def discount(price)
		#price - self.amount
		if self.discount_type = 'percent'
			price / 100 * self.amount	
		else
			self.amount	
		end
		
	end
end
