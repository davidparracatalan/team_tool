class Changing table name from subteams to projects < ActiveRecord::Migration
  def up
    rename_table subteams projects
  end

  def down
    rename_table projects subteams
  end
end
