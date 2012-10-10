require 'spec_helper'

feature "Delete Event", %q{
  As a registred user
  I want to delete an event
  } do
    background do
      Capybara.current_driver = :selenium
      @user = FactoryGirl.create(:user)
      @event = FactoryGirl.create(:event, :user => @user, :name => "Dead Event Walking")
      login_user(@user)
    end
    
    after do
      Capybara.use_default_driver
    end
    
    scenario "Delet Event" do
      page.should have_content("Dead Event Walking")
      page.should have_selector("Form[action='/events/#{@event.id}'] input[value='delete']")
      page.execute_script('window.confirm = function() { return true; }')
      click_button "X"
      page.should_not have_content("Dead Event Walking")
    end
  end
    
      