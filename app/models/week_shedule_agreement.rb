class WeekSheduleAgreement < ActiveRecord::Base

  validates_presence_of :week_begin_at, :user_id

end
