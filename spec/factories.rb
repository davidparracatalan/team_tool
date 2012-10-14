FactoryGirl.define do
  factory :teammate do
    eciidentifier {"X#{rand(10000..99999)}AA"}
    sequence(:last_name) {|n| "Last #{n}"}
    sequence(:contracting_company) {|n| "Company #{n}"}
    sequence(:subcontracting_company) {|n| "Subcontactor #{n}"}
  end
end