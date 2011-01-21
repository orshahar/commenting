module CommentThreadsHelper

  def sort_td_class_helper(sort)
    result = 'class=\'sortup\'' if params[:sort] == sort
    result = 'class=\'sortdown\'' if params[:sort] == sort + "_reverse"
    return result
  end

  def sort_link_helper(text, sort)
    sort += "_reverse" if params[:sort] == sort
    options = {
        :action => 'index',
        :sort => sort,
    }
    html_options = {
        :title => "Sort by this field",
    }
    link_to text, options, html_options
  end

   def sort_td_image_helper(param)
    result = image_tag '/images/arrow_up_blue.png' if params[:sort] == param
    result = image_tag '/images/arrow_down_blue.png' if params[:sort] == param + "_reverse"
    return result
   end

end
