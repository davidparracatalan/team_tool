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

require 'spec_helper'

describe Assignment do

  before do
    @assignment = Assignment.new(teammate_id: 1, 
                                 subteam_id: 1,
                                 start_date: Time.now,
                                 foreseen_end_date: Time.now+(3*24*60*60))

  end

  subject{@assignment}

  it {should respond_to(:teammate_id)}
  it {should respond_to(:subteam_id)}
  it {should respond_to(:start_date)}
  it {should respond_to(:foreseen_end_date)}
  it {should respond_to(:end_date)}



  describe "validate presence of teammate" do
    before {@assignment.teammate_id=""}
    it{should_not be_valid}
  end

  describe "validate presence of subteam_id" do
    before {@assignment.subteam_id=""}
    it {should_not be_valid}
  end

  describe "start date must be sooner than foreseen end date" do
    before {@assignment.start_date = Time.now+(8*24*60*60)}
    it {should_not be_valid}
  end
end
