module ApplicationHelper
  def dateUnlessEmpty date
    if date.nil?
      "Don't know yet"
    else
      date.strftime('%d %b %Y')
    end
  end
end
