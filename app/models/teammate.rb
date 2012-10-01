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

class Teammate < ActiveRecord::Base
  attr_accessible :eci_id, :last_name, :name, :contracting_company, :subcontracting_company
end
