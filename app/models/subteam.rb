# == Schema Information
#
# Table name: subteams
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  start_date        :datetime
#  foreseen_end_date :datetime
#  end_date          :datetime
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#

class Subteam < ActiveRecord::Base
  attr_accessible :end_date, :foreseen_end_date, 
                  :name, :start_date
  
  validates :name, presence: true
  validates :start_date, presence: true
  validates :foreseen_end_date, presence: true

  has_many :teammates, :through => :assignments

end
