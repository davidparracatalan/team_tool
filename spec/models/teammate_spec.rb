# == Schema Information
#
# Table name: teammates
#
#  id                     :integer         not null, primary key
#  eciidentifier          :string(255)
#  name                   :string(255)
#  last_name              :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  contracting_company    :string(255)
#  subcontracting_company :string(255)
#

require 'spec_helper'

describe Teammate do

  before do
    @teammate = Teammate.new(eciidentifier: "X12345AA",
                             name: "Pepe",
                             last_name: "Perez",
                             contracting_company: "Example LTD",
                             subcontracting_company:"Friends Of Example LTD")
  end

  subject{@teammate}

  it {should respond_to(:eciidentifier)}
  it {should respond_to(:name)}
  it {should respond_to(:contracting_company)}
  it {should respond_to(:subcontracting_company)}

  describe "validating required presence" do
    describe "when eciidentifier is not present" do
      before {@teammate.eciidentifier=""}
      it{should_not be_valid}
    end
    describe "when name is not present" do
      before {@teammate.name=""}
      it{should_not be_valid}
    end
    describe "when contracting company is not present" do
      before {@teammate.contracting_company=""}
      it{should_not be_valid}
    end
  end
  
  describe "validating format and sizes" do
    describe "when eccidentifier is bigger then  8 characters length" do
      before {@teammate.eciidentifier="X123456AB"}
      it{should_not be_valid}
    end
    describe "when eccidentifier is smaller then  8 characters length" do
      before {@teammate.eciidentifier="X12B"}
      it{should_not be_valid}
    end
    describe "when eciidentifier format is not valid" do
      before {@teammate.eciidentifier="123XX23A"}
      it{should_not be_valid}
    end
    describe "when an internal eciidentifier is valid" do
      before {@teammate.eciidentifier = "12345678"}
      it{should be_valid}
    end
    describe "when an external eciidentifier is valid" do
      before {@teammate.eciidentifier = "X12345AB"}
    end
  end

  describe "validating assignments to subteams" do

    let(:subteam) {FactoryGirl.create(:subteam)}

    before do
      @teammate.save
      @teammate.assign_to!(subteam, 1.day.from_now, 2.days.from_now)
    end

    describe "A teammate is asigned to a subteam" do
      its(:subteams) {should include(subteam)}
    end
  end

  describe "Getting subteams to be assigned" do
    let(:subteam_1) {FactoryGirl.create(:subteam)}
    let(:subteam_2) {FactoryGirl.create(:subteam)}
    before do
      @teammate.save
    end
    its(:subteams_not_assigned_to_me) {should include(subteam_1, subteam_2)}
  end
end
