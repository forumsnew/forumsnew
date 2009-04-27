	require 'digest/sha1'

class User < ActiveRecord::Base
	has_many :participants
  has_many :orders, :through => :participants
  attr_protected :admin, :writer
  
  


	
	
		
	has_many :posts
	has_many  :orders	
	
  validates_presence_of :forename, :surname, :address1, :town, :postcode, :county, :country, :rows, :email, :paypal
	validates_uniqueness_of :email
	
	validates_uniqueness_of :paypal, :message => "Email has already been taken"
	
	validates_inclusion_of :rows,
													:in => 10..100,
													:message => "should be between 10 and 100"

	attr_accessor :password_confirmation
	validates_confirmation_of :password
	
	validate :password_non_blank
	
	def self.authenticate(email, password)
		user = self.find_by_email(email)
		if user
			expected_password = encrypted_password(password, user.salt)
			if user.hashed_password != expected_password
				user = nil
			end
		end
		user
	end
	
	# 'password' is a virtual attribute
	def password
		@password
	end
	
	def password=(pwd)
		@password = pwd
		return if pwd.blank?
		create_new_salt
		self.hashed_password = User.encrypted_password(self.password, self.salt)
	end
	
	private
	
	def password_non_blank
		errors.add(:password, "Missing password" ) if hashed_password.blank?
	end
	
	def create_new_salt
		self.salt = self.object_id.to_s + rand.to_s
	end
	
	def self.encrypted_password(password, salt)
		string_to_hash = password + "wibble" + salt
		Digest::SHA1.hexdigest(string_to_hash)
	end
end