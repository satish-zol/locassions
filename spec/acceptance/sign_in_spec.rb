require 'spec_helper'

feature 'Sign In', %q{
  As an administrator
  I want to sign in to Locassions
  } do
    background do
     visit "/"
     click_on 'Sign In'
    end
    
    scenario "Click Sign In" do
      page.should have_selector('title', :content => "Locassions: Sign In" )
      page.should have_selector('form')
    end
    
    scenario "Successful sign in" do
      FactoryGirl.create(:user)      
      click_sign_in
      fill_in 'Email', :with => 'testy@example.com'
      fill_in 'Password', :with => 'password'
      click_on'Sign in'
      current_path.should == user_root_path
      page.should have_selector("a", :text => "My Events", :href => user_root_path)
    end
    
    scenario "Unsuccessful sign in" do
      click_sign_in
      fill_in 'Email', :with => 'hacker@getyou.com'
      fill_in 'Password', :with => 'badpassword'
      click_on 'Sign in'
      current_path.should == user_session_path
      page.should have_content("Invalid email or password.")
    end
    
    
   end
    