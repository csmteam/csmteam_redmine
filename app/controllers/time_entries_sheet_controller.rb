class TimeEntriesSheetController < ApplicationController
  def index
    @issues = Issue.where(status_id:2).includes(:project)
    @date = Date.today.beginning_of_week
  end

  def show
    @issues = Issue.where(status_id:2).includes(:project)
    @date = Date.today.beginning_of_week
  end

end
