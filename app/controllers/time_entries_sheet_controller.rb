class TimeEntriesSheetController < ApplicationController

  def index
    @issues = Issue.where(status_id:2).includes(:project)
    @date = Date.today.beginning_of_week
  end

  def show
    @issues = Issue.where(status_id:2).includes(:project)
    @date = params[:date].to_date.beginning_of_week
  end

  def create
    params[:time_entries].keys.each do |key|
      next unless params[:time_entries][key].present?
      hours = params[:time_entries][key]
      parts = key.split("|")
      issue =  Issue.find_by_id(parts[1])
      next unless issue
      date = parts[0].to_date
      next unless date
      te = TimeEntry.where(issue_id:issue.id).where(user_id: User.current.id).where(spent_on:date).first_or_initialize(project_id:issue.project_id,activity_id:19)
      te.hours = hours.to_f
      te.save
    end

  end

end
