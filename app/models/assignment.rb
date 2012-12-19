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

  belongs_to :teammate
  belongs_to :subteam

end
