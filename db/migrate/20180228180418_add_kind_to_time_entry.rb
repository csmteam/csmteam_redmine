class AddKindToTimeEntry < ActiveRecord::Migration
  def change
    add_column :time_entries, :kind, :string, default: 'overtime'
  end
end
