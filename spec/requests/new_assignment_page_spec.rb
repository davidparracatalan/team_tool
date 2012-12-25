require 'spec_helper'

describe "New assignment page" do


  subject{page}

  let!(:mate){FactoryGirl.create(:teammate)}
  let!(:subteam){FactoryGirl.create(:subteam)}

  before do 
    visit ("/teammates/#{mate.id}/assignments/new?subteam_id=#{subteam.id}")
  end

  describe "Validating elements in the page" do
    it {should have_selector('h2'), text: "You're assigning #{mate.name} to #{subteam.name}"}
    it {should have_selector('label'), text: "Start date"}
    it {should have_selector('label'), text: "Foreseen end date"}
    it {should have_button('Confirm assignment')}
  end

  describe "Confirming the assignment" do
    before {click_button('Confirm assignment')}
    it {current_path.should == subteam_assignments_teammate_path(mate)}
  end

end