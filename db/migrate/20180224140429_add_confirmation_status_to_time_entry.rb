class AddConfirmationStatusToTimeEntry < ActiveRecord::Migration
  def change
    add_column :time_entries, :confirmation_status, :string, default: 'pending'
  end
end
