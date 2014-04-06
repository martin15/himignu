module ApplicationHelper

  def msg_flash(flash)
    str = ""
    flash.each do |key, value|
      str += "<p class='#{key}'>#{value}</p><br />"
    end
    #str+= "<br /><br />" unless flash.empty?
    return str
  end

  def short_desc(text, count)
    new_text_splited = text.split(" ")[0, count]
    return new_text_splited.join(" ")
  end
end
