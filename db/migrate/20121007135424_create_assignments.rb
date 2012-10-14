class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :teammate_id
      t.integer :subteam_id

      t.timestamps
    end

  add_index :assignments, :teammate_id
  add_index :assignments, :subteam_id
  add_index :assignments, [:teammate_id, :subteam_id], unique: true
  end
end
