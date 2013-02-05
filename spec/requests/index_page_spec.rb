require 'spec_helper'

describe "Teammates app index page" do
  
  subject {page}

  describe "index" do

    before {visit root_path}

    it {should have_selector('title', text:"TeamTool")}
   
    describe "index page having teammates and subteams in the playground" do
      
      let(:mate) {FactoryGirl.create(:teammate)}
      let(:subteam) {FactoryGirl.create(:subteam)}
      
      before do
        mate.save
        subteam.save
        visit root_path
      end
      it {should have_selector('li a', text:"Teammates")}
      it {should have_selector('li a', text:"Subteams")}
      
      describe "elements for each teammate" do
        it {should have_selector('td', text:"#{mate.eciidentifier}")}   
        it {should have_selector('td', text:"#{mate.name}")}
        it {should have_selector('td', text:"#{mate.last_name}")}
        it {should have_selector('td', text:"#{mate.contracting_company}")}
        it {should have_selector('td', text:"#{mate.subcontracting_company}")}
        it {should have_link('View'), href: teammate_path(mate)}
        it {should have_link('Edit'), href: edit_teammate_path(mate)}
        it {should have_link('Delete'), href: teammate_path(mate)}
        it {should have_link('Assingments'), href:  teammate_assignments_path(mate)}
      end
    end


    describe "visitting the index page with an empty database" do      
      before do
        Teammate.destroy_all
        Subteam.destroy_all
        visit root_path
      end
      it {should_not have_selector('td')}
      it {should have_selector('div'), text:"There are no teammates. Please click the button below to create a new mate"}
    end
  end

end