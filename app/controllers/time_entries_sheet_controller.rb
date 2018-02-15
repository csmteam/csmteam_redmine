class TimeEntriesSheetController < ApplicationController
  def index

    @issues = Issue.where(status_id:2).includes(:project) 

  end
end
