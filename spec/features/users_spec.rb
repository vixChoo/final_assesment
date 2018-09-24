require 'rails_helper'
# capybara
RSpec.feature "Users", type: :feature do


  context'create a new user' do
    scenario "Should successful" do
      visit new_user_path
      # DO This within (Something)
      within('form') do
        fill_in 'Name' , with: 'sample'
        fill_in 'E-mail' ,with: 'sample@email.com'
        fill_in 'Password' ,with: 'sample123'
        fill_in 'Password Confirmation' , with:'sample123'
      end
      click_button 'Sign up'
      expect(page).to have_content('Account created successfully!')
    end


    scenario "Should fail" do
      visit new_user_path
      # fail bcuz name is missing
      
      within('form') do
        fill_in 'E-mail' ,with: 'sample@email.com'
        fill_in 'Password' ,with: 'sample123'
        fill_in 'Password Confirmation' , with:'sample123'
      end
      click_button 'Sign up'
      expect(page).to have_content("Oops, couldn't create account. Please make sure you are using a valid email and password and try again.")
      
    end
  end
  
  




end
