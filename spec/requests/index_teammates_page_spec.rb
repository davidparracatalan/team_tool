require 'spec_helper'

describe "Teammates app index page" do
  
  subject {page}

  describe "index" do

    before {visit root_path}

    it {should have_selector('title', text:"TeamTool")}
   
    describe "index page having teammates in the playground" do
      
      let(:mate) {FactoryGirl.create(:teammate)}
      
      before do
        mate.save
        visit root_path
      end
   
      it {should have_selector('td', text:"#{mate.eciidentifier}")}   
      it {should have_selector('td', text:"#{mate.name}")}
      it {should have_selector('td', text:"#{mate.last_name}")}
      it {should have_selector('td', text:"#{mate.contracting_company}")}
      it {should have_selector('td', text:"#{mate.subcontracting_company}")}
      it {should have_link('View'), href: teammate_path(mate)}
      it {should have_link('Edit'), href: edit_teammate_path(mate)}
      it {should have_link('Delete'), href: teammate_path(mate)}
      it {should have_link('Assing to a subteam'), href: availableassignmets_teammate_path(mate)}

      describe "Clicking on assign to a team link shows available assignments page" do
        before do
          click_link 'Assing to a subteam'
        end
        it {should have_selector('h1', text:"Listing available assignments for #{mate.name}")}
      end
    end

    describe "visitting the index page with an empty database" do      

      before do
        Teammate.destroy_all
        visit root_path
      end

      it {should_not have_link('View')}
      it {should_not have_link('Edit')}
      it {should_not have_link('Delete')}
    end
    
  end

end