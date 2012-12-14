require 'spec_helper'

describe "Teammate's assignments page" do
  
  subject {page}

  let(:mate) {FactoryGirl.create(:teammate)}
  let(:subteam_1) {FactoryGirl.create(:subteam)}
  let(:subteam_2) {FactoryGirl.create(:subteam)}

  describe "Teammate assignment page without any team assigned" do
    before do
      visit team_assignments_teammate_path(mate)
    end
      it {should have_selector('h1', text:"#{mate.name} is not assigned to any subteam yet")}
      it {should have_selector('span', text:"#{subteam_1.name}")}
      it {should have_selector('span', text:"#{subteam_2.name}")}
      it {should have_css("#assignment_button")}
  end

  describe "Teammate assignment page with assignments" do

    before do
      mate.assign_to! subteam_1
      visit team_assignments_teammate_path(mate)
    end

    it {should have_selector('h1', text:"#{mate.name}'s assignments")}
    it {should have_selector('h2', text:"#{mate.name} is assigned to the following subteams:")}
    it {find("#assigned_teams_list").should have_selector('li', text:"#{subteam_1.name}")}
    it {find("#assigned_teams_list").should_not have_selector('li', text:"#{subteam_2.name}")}
    it {find("#available_teams").should_not have_selector('span', text:"#{subteam_1.name}")}
  end
end  