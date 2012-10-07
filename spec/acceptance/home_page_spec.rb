require 'spec_helper' 
feature 'Home Page', %q{
  As an unregistred user
  I want to see home/landing page
} do
  background do
    #nothing do here
  end

  scenario "Home page" do
    visit "/"
    page.should have_link('Sign In')
    page.should have_selector('title', :content => "Locassions")
    page.should have_selector('h3', :content => 'What is Loccasions?')
  end
end
  
