class CreateSubteams < ActiveRecord::Migration
  def change
    create_table :subteams do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :foreseen_end_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
