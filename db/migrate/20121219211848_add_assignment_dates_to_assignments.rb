class AddAssignmentDatesToAssignments < ActiveRecord::Migration
  def up
    add_column :assignments, :start_date, :date
    add_column :assignments, :foreseen_end_date, :date
  end

  def down
    remove_column :assignments, :start_date, :date
    remove_column :assignments, :foreseen_end_date, :date
  end
end
