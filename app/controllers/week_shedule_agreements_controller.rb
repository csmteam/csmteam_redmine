class WeekSheduleAgreementsController < ApplicationController


  def create
    @wsa = WeekSheduleAgreement.create(user_id:params[:user_id], week_begin_at: Date.parse(params[:date]))
  end


  def destroy
    @wsa = WeekSheduleAgreement.where(user_id: params[:user_id]).where(week_begin_at: Date.parse(params[:date])).first
    @wsa.destroy if @wsa
  end



end
