# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	
	def toggle_value(object)
remote_function(:url => url_for(object),
:method => :put,
:before => "Element.show('spinner-#{object.id}')" ,
:complete => "Element.hide('spinner-#{object.id}')" ,
:with => "this.name + '=' + this.checked" )
end

	def is_admin (user)
		if user.admin
			true	
		else
			false	
		end
	end
	
	def is_writer (user)
		if user.writer
			true	
		else
			false	
		end
	end
	
	def timeago(time, options = {})
    start_date = options.delete(:start_date) || Time.new
    date_format = options.delete(:date_format) || :default
    delta_minutes = (start_date.to_i – time.to_i).floor / 60
    if delta_minutes.abs <= (8724*60) # eight weeks… I’m lazy to count days for longer than that
      distance = distance_of_time_in_words(delta_minutes);
      if delta_minutes < 0
        "#{distance} from now"
      else
        "#{distance} ago"
      end
    else
      return "on #{system_date.to_formatted_s(date_format)}"
    end
  end

  
end
