module TimeEntriesSheetHelper

  def create_hours_hash date_from,date_to, user
    time_entries = TimeEntry.where(user_id: user.id).where(spent_on: date_from..date_to)
    Hash[*time_entries.map{ |a| ["#{a.spent_on.strftime("%Y-%m-%d")}|#{a.issue.id}", a.hours] }.flatten]
  end

end
