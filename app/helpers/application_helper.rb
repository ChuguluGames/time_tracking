module ApplicationHelper

  def famfam(icon, opt = {})
    image_tag("icons/#{icon}.png", opt.merge(:width => 16, :height => 16))
  end

end
