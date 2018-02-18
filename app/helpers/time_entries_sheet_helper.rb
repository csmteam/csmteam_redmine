module TimeEntriesSheetHelper

  def create_hours_hash date, user
    time_entries = TimeEntry.where(user_id: user.id).where("spent_on >= ? AND spent_on <= ?", date, date + 6.days)
    # time_entries.group_by{|a| "#{a.spent_on.strftime("%Y-%m-d")}|#{a.id}"}
    Hash[*time_entries.map{ |a| ["#{a.spent_on.strftime("%Y-%m-%d")}|#{a.issue.id}", a.hours] }.flatten]
  end

end
