class CreateTeammates < ActiveRecord::Migration
  def change
    create_table :teammates do |t|
      t.string :eci_id
      t.string :name
      t.string :last_name

      t.timestamps
    end
  end
end
