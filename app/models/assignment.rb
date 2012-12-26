# == Schema Information
#
# Table name: assignments
#
#  id                :integer         not null, primary key
#  teammate_id       :integer
#  subteam_id        :integer
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  start_date        :date
#  foreseen_end_date :date
#  end_date          :date
#

class Assignment < ActiveRecord::Base
  attr_accessible :subteam_id, :teammate_id, :start_date, :foreseen_end_date
  validates :subteam_id, presence: true
  validates :teammate_id, presence: true
  validate :validate_start_date_before_foreseen_end_date

  belongs_to :teammate
  belongs_to :subteam

  private

  def validate_start_date_before_foreseen_end_date
    if start_date && foreseen_end_date
      errors.add(:foreseen_end_date, "start date must be before foreseen end date") if foreseen_end_date < start_date
    end    
  end
end
