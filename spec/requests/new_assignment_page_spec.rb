require 'spec_helper'

describe "New teammate's assignment page" do


  subject{page}

  let!(:mate){FactoryGirl.create(:teammate)}
  let!(:subteam){FactoryGirl.create(:subteam)} 

  before do 
    visit new_teammate_assignment_path(mate)
  end

  describe "Validating elements in the page" do
    describe "without available assignments" do
      before do
        mate.assign_to!(subteam, 1.day.from_now, 3.days.from_now)
        visit new_teammate_assignment_path(mate)
      end
      it {should have_selector('h3', 
                  text:"Sorry, you can't assign #{mate.name} to any subteam because there's no one available now")}
    end

    describe "with available assignments" do

      it {should have_selector('h3'), text: "Please, select the subteam and set the dates"}
      it {should have_selector('label'), text: "Start date"}
      it {should have_selector('label'), text: "Foreseen end date"}
      it {should have_field('assignment_start_date')}
      it {should have_field('assignment_foreseen_end_date')}    
      it {should have_button('Assign')}
      it {should have_selector('select'), id: "assignment_subteam_id"}
      it {should have_select('assignment_subteam_id')}
    end
    
  end

  describe "Assigning" do
   


    describe "without fulfilling the form" do
      before{click_button "Assign"}
      it{should have_selector('div.alert')}
      it {find('div.alert').should have_selector('h2'), 
        text: '2 errors prohibited this assignment from being saved:' }
    end

    describe "selecting wrong dates" do
      before do 
        fill_in 'assignment_start_date', with: "#{2.days.from_now}"
        fill_in 'assignment_foreseen_end_date', with: "#{2.days.ago}"
        click_button "Assign"
      end
      it{should have_selector('div.alert')}
      it {find('div.alert ul').should have_selector('li'), 
        text: 'End date Foreseen end date must be greater than start date' }
    end
  end
end