module CommentsHelper

  def calc_time(date)
    total_seconds = (Time.now - date).to_i

    days = total_seconds / 86400
    hours = (total_seconds / 3600) - (days * 24)
    minutes = (total_seconds / 60) - (hours * 60) - (days * 1440)
    seconds = total_seconds % 60

    display = ''
    display_concat = ''

    if days > 0
      display = display + display_concat + pluralize(days, 'day')
      display_concat = ' '
    end
    if hours > 0
      display = display + display_concat + pluralize(hours, 'hour')
      display_concat = ' '
    end
    if minutes > 0
      display = display + display_concat + pluralize(minutes, 'minute')
      display_concat = ' '
    end

    if display.length > 0
      display = display + " ago"
    else
      display = 'just now'
    end

    return display
  end

end
