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
  pending "add some examples to (or delete) #{__FILE__}"
end
