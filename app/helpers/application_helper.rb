module ApplicationHelper
  
  def error_messages(object)
    html = ""
    object.errors.full_messages.each do |msg|
       html << "<li>#{msg}</li>"
    end
    html
  end

end
