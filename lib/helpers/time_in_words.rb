require 'date'

module TimeInWords

  def self.time_ago_in_words(time)
    to_time = Time.now
    from_time = time
    distance_of_time_in_words(from_time, to_time).to_s + " ago"
  end

  def self.distance_of_time_in_words(from_time, to_time)
    from_time, to_time  = to_time, from_time if from_time > to_time
    distance_in_seconds = (to_time - from_time).round
    distance_in_minutes = (distance_in_seconds.to_f   /   60.0).round
    distance_in_hours   = (distance_in_minutes.to_f   /   60.0).round
    distance_in_days    = (distance_in_minutes.to_f   /   1440.0).round
    distance_in_months  = (distance_in_minutes.to_f   /   43200.0).round

    case distance_in_minutes
      when 0...1
        case distance_in_seconds
          when 1        then "#{distance_in_seconds} second"
          when 2...60   then "#{distance_in_seconds} seconds"
        end

      when 1                then "#{distance_in_minutes} minute"
      when 2...60           then "#{distance_in_minutes} minutes"
      when 60...90          then "about one hour"
      # 90 mins up to 24 hours
      when 90...1440        then "#{distance_in_hours} hours"
      # 24 hours up to 42 hours
      when 1440...2520      then "one day"
      # 42 hours up to 30 days
      when 2520...43200     then "#{distance_in_days} days"
      # 30 days up to 60 days
      when 43200...86400    then "about a month"
      # 60 days up to 365 days
      when 86400...525600   then "#{distance_in_months} months"
    end

  end

end
