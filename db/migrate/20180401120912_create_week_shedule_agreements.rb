class CreateWeekSheduleAgreements < ActiveRecord::Migration
  def change
    create_table :week_shedule_agreements do |t|
      t.date :week_begin_at
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
