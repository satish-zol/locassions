require 'spec_helper'

feature "Add Events", %q{
  As a registred user
  I want to add Events
  } do
    background do
     login_user(FactoryGirl.create(:user))
    end
    
    scenario "Add Basic Event" do
      fill_in "Name", :with => "New Event"
      fill_in "Description", :with => "This is my new event"
      click_button "Create Event"
      page.should have_content("New Event")
      page.should have_content("This is my new event")
      page.should have_selector("ul > li")
      page.current_path == events_path
    end
    
  end
    