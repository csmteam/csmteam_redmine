class TimeEntriesSheetController < ApplicationController

  include TimeEntriesSheetHelper

  def index
    @issues = Issue.where(status_id:2).includes(:project)
    @date = Date.today
    @hours = create_hours_hash @date.beginning_of_week, @date.end_of_week, User.current
  end

  def show
    @issues = Issue.where(status_id:2).includes(:project)
    @date = params[:date].to_date
    @hours = create_hours_hash @date.beginning_of_week, @date.end_of_week, User.current
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
      te = TimeEntry.new(issue_id:issue.id, user_id: User.current.id, spent_on:date, kind: 'common', project_id:issue.project_id,custom_field_values:{"5"=>"", "7"=>"0"})
      te.activity = te.project.activities.first
      te.hours = hours.to_f
      te.save

      @issues = Issue.where(status_id:2).includes(:project)
      @date = params[:date].to_date
      @hours = create_hours_hash @date.beginning_of_week, @date.end_of_week, User.current
      render :show
    end

  end

  def confirmation
    @date = params[:date].try(:to_date) || Date.today
    @time_entries = TimeEntry.where(spent_on: @date.beginning_of_week..@date.end_of_week)
  end

  def confirmation_data
    return if !params[:date].present? || !params[:user_id].present?
    @date = params[:date].try(:to_date)
    @user = User.find_by_id(params[:user_id])
    return if !@date || !@user
    @time_entries = TimeEntry.where(user_id: @user.id).where(spent_on: @date.beginning_of_week..@date.end_of_week)
    @wsa = WeekSheduleAgreement.where(user_id: @user.id).where(week_begin_at: @date).first
  end

  def confirm
    TimeEntry.where(id:params[:ids].split(',')).update_all(:confirmation_status => 'confirmed')
    redirect_to time_entries_confirmation_url
  end

  def reject
    @ids = params[:ids].split(',')
    if(request.method == "POST")
      TimeEntry.where(id: @ids).update_all(:confirmation_status => 'rejected', comments: params[:comment])
      redirect_to time_entries_confirmation_url
    end
  end


end
