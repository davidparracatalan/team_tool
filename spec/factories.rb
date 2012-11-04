FactoryGirl.define do
  factory :teammate do
    eciidentifier {"X#{rand(10000..99999)}AA"}
    name {"Mike"}
    sequence(:last_name) {|n| "Last #{n}"}
    sequence(:contracting_company) {|n| "Company #{n}"}
    sequence(:subcontracting_company) {|n| "Subcontactor #{n}"}
  end

  factory :subteam do
    sequence(:name) {|n| "Team - #{n}"}
    start_date {Time.now}
    foreseen_end_date {Time.now}
  end
end