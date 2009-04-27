class Setting < ActiveRecord::Base
	validates_presence_of :site_name
end
