require 'spec_helper'

describe "New assignment page" do


  subject{page}

  let!(:mate){FactoryGirl.create(:teammate)}
  let!(:subteam){FactoryGirl.create(:subteam)}

  before do
    #Since capybara's visit methos doesn't take more than one param I don't
    #know how to visit directly the teammate-subteam assignment url. Using a
    #quite ugly workaround
    visit subteam_assignments_teammate_path(mate)
    click_button "Assign"
  end

  describe "Validating elements in the page" do
    it {should have_selector('h2'), text: "You're assigning #{mate.name} to #{subteam.name}"}
    it {should have_selector('label'), text: "Start date"}
    it {should have_selector('label'), text: "Foreseen end date"}
  end

end