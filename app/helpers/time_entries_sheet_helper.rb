module TimeEntriesSheetHelper

  def weeks_selector_data
    result = []
    @current_date = Date.today.beginning_of_year

    while @current_date.strftime('%Y') == Date.today.strftime('%Y')
      @week_number = @current_date.strftime('%W')
      @monday = @current_date.at_beginning_of_week
      result.push ["#{@week_number} (#{@monday.strftime('%d.%m')} - #{(@monday + 6.days).strftime('%d.%m')})",@monday.strftime('%d-%m-%Y')]
      @current_date += 7.days
    end

    result
  end

  def create_hours_hash date_from,date_to, user
    time_entries = TimeEntry.where(user_id: user.id).where(kind:'common').where(spent_on: date_from..date_to)
    Hash[*time_entries.map{ |a| ["#{a.spent_on.strftime("%Y-%m-%d")}|#{a.issue.id}", a.hours] }.flatten]
  end

end
