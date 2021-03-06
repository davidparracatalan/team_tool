# == Schema Information
#
# Table name: teammates
#
#  id                     :integer         not null, primary key
#  eciidentifier          :string(255)
#  name                   :string(255)
#  last_name              :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  contracting_company    :string(255)
#  subcontracting_company :string(255)
#

class Teammate < ActiveRecord::Base
  attr_accessible :eciidentifier, :last_name, :name, 
                  :contracting_company, :subcontracting_company

  VALIDATE_ECIIDENTIFIER_REGEX=/\A[X,\d]\d\d\d\d\d[[A-Z],\d][[A-Z],\d]\z/i
  validates :eciidentifier, presence: true, 
                            length: {is: 8},
                            format: {with: VALIDATE_ECIIDENTIFIER_REGEX}
  validates :name, presence: true
  validates :contracting_company, presence: true

  has_many :assignments
  has_many :subteams, :through => :assignments


  def assign_to! subteam, start_date, foreseen_end_date
    assignments.create!(subteam_id: subteam.id, 
                        start_date: start_date, 
                        foreseen_end_date: foreseen_end_date)
  end

  def subteams_not_assigned_to_me
    Subteam.active.has_no_assignments + 
    Subteam.active.where(id: Assignment.select("subteam_id").where("teammate_id != ?", id))
  end

end
