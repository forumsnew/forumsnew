class Product < ActiveRecord::Base
	has_many :order
	has_many :coupons
	belongs_to :category
end
