require 'spec_helper'

describe "Teammate pages" do
  
  subject {page}

  describe "index" do
    before {visit root_path}
    it {should have_selector('title', text:"TeamTool")}
  end
end