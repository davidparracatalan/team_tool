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

require 'spec_helper'

describe Subteam do
  before do
    @subteam = Subteam.new(name: "cool webs",
                            start_date: Time.now,
                            foreseen_end_date: Time.now+(3*24*60*60))
  end

  subject{@subteam}

  it {should respond_to(:name)}
  it {should respond_to(:start_date)}
  it {should respond_to(:foreseen_end_date)}
  it {should respond_to(:end_date)}

  describe "validating required presence" do
    describe "when name is not present" do
      before {@subteam.name = ""}
      it {should_not be_valid}
    end
    describe "when start_date is not present" do
      before {@subteam.start_date = ""}
      it {should_not be_valid}
    end
    describe "when foreseen_date is not present" do
      before {@subteam.foreseen_end_date = ""}
      it {should_not be_valid}
    end
  end
end
