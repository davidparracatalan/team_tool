# == Schema Information
#
# Table name: assignments
#
#  id          :integer         not null, primary key
#  teammate_id :integer
#  subteam_id  :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Assignment < ActiveRecord::Base
  attr_accessible :subteam_id, :teammate_id

  belongs_to :teammate
  belongs_to :subteam

end
