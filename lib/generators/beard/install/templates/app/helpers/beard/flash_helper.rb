module Beard
  module FlashHelper
    def notifications
      output = "".html_safe
      output << content_tag(:p, notice, :class => "flash_notice") if notice
      output << content_tag(:p, alert, :class => "flash_alert") if alert

      unless output.blank?
        output = content_tag(:div, output, :class => "flash")
      end

      output
    end
  end
end