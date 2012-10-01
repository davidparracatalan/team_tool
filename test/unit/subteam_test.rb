# == Schema Information
#
# Table name: subteams
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  start_date        :datetime
#  foreseen_end_date :datetime
#  end_date          :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class SubteamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
