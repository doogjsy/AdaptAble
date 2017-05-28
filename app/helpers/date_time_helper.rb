module DateTimeHelper

  def format_date(date_time)
    if date_time.present?
      date_time.to_datetime.strftime('%B %e, %Y')
    else
      'No date set'
    end
  end

  def format_short_date(date_time)
    if date_time.present?
      date_time.to_datetime.strftime('%a %e')
    else
      'No date set'
    end
  end

  def format_datetime(date_time)
    if date_time.present?
      date_time.to_datetime.strftime('%B %e %Y at %H:%M')
    else
      'No datetime set'
    end
  end

  def format_month_and_year(date_time)
    if date_time.present?
      date_time.to_datetime.strftime('%B %Y')
    else
      'No date set'
    end
 end

  # This is nasty...
  # Because this gem wont give me '8 months and 29 days'
  # Only '8 months, 4 weeks and 1 day'
  def distance_of_time_in_months_and_days(date, short=true)
    string = distance_of_time_in_words(Time.now, date, false, only: [:months, :weeks, :days])
    parts = string.gsub('and',',').split(',')
    months, weeks, days = 0,0,0
    parts.each do |part|
      if num_months = /(\d+) month/.match(part)
        months = num_months[1].to_i
      elsif num_weeks = /(\d+) week/.match(part)
        weeks = num_weeks[1].to_i
      elsif num_days = /(\d+) day/.match(part)
        days = num_days[1].to_i
      end
    end
    days = days + (weeks * 7)
    if short
      "#{months}m #{days}d"
    else
      "#{pluralize(months, 'month')} and #{pluralize(days, 'day')}"
    end
  end
end
