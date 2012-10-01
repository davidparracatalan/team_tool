class AddContractinCompanies < ActiveRecord::Migration
  def up
    add_column :teammates, :contracting_company, :string
    add_column :teammates, :subcontracting_company, :string
  end

  def down
    remove_column :teammates,:contracting_company
    remove_column :teammates,:subcontracting_company
  end
end
