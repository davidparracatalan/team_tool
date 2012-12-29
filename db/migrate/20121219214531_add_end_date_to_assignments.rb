class AddEndDateToAssignments < ActiveRecord::Migration
  def up
    add_column :assignments, :end_date, :date
  end

  def down
    remove_column :assignments, :end_date, :date
  end
end
