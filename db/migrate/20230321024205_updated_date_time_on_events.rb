class UpdatedDateTimeOnEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :time, :time
    remove_column :events, :date, :date
    add_column :events, :date, :datetime
  end
end
