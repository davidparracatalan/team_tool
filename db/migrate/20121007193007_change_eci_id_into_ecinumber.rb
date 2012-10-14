class ChangeEciIdIntoEcinumber < ActiveRecord::Migration
  def up
    rename_column :teammates, :eci_id, :eciidentifier
  end

  def down
    rename_column :teammates, :eciidentifier, :eci_id
  end
end
