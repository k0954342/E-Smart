module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"   #Attributes are set to style the cart in the application layout
    end
    content_tag("div", attributes, &block)   #encase the content and the attributes within a <div>
  end
  def start_icon_menu
    @icon_menu_column = 0
    "<table class='icon_menu'>".html_safe
  end

  def icon_menu_item( title, image, url )
    text = ""
    if @icon_menu_column >= 4
      text = "</tr>"
      @icon_menu_column = 0
    end
    if @icon_menu_column == 0
      text += "<tr>"
    end
    text += "<td><div class='icon_menu_item' onclick=\"location.href='#{url}';\"><span>#{title}</span>" + image_tag( image ) + "</div></td>"
    @icon_menu_column += 1

    text.html_safe
  end

  def end_icon_row_internal
    text = ""
    if @icon_menu_column > 0
      while @icon_menu_column < 4
        text += "<td><div class='icon_menu_dummy'></div></td>"
        @icon_menu_column += 1
      end
      text += "</tr>"
    end

    text
  end

  def end_icon_row
    end_icon_row_internal.html_safe
  end

  def end_icon_menu
    (end_icon_row_internal + "</table>").html_safe
  end


end
