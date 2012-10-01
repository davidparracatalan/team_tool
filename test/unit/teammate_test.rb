# == Schema Information
#
# Table name: teammates
#
#  id                     :integer          not null, primary key
#  eci_id                 :string(255)
#  name                   :string(255)
#  last_name              :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  contracting_company    :string(255)
#  subcontracting_company :string(255)
#

require 'test_helper'

class TeammateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
