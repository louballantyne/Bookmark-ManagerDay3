require_relative "../../app"
require_relative "../helper_methods"

feature 'Homepage' do
  scenario 'User navigates to homepage and sees title' do
    visit '/'
    expect(page).to have_text "Bookmark Manager"
  end
end

feature '/bookmark' do
  before do
    add_bookmarks
  end
  scenario 'should serve bookmark page' do
    visit '/bookmark'
    expect(page).to have_content("Your Bookmarks:")
    expect(page).to have_content("Google")
  end



  feature 'add bookmark' do
    scenario 'user is able to add www.makers.tech' do
      visit '/bookmark'
      click_on('add_bookmark')
      fill_in('title', :with => 'Makers')
      fill_in('bookmark', :with => 'www.makers.tech')
      click_on('bookmark')
      expect(page).to have_link('Makers', href: "www.makers.tech")
    end
  end

  feature "delete a bookmark" do
    scenario "user will delete the selected bookmark from the database table" do
      visit '/bookmark'
      first('.bookmark').click_button 'Delete'
      expect(page).not_to have_content("Makers Academy")
    end
  end

  feature 'update a bookmark' do
    scenario 'User will change the address of the Makers bookmark' do
      visit '/bookmark'
      first('.bookmark').click_button 'Update'
      fill_in('url', :with => 'http://www.google.com')
      click_on 'Update'
      expect(page).to have_link('Google', href: "http://www.google.com")
    end
  end

  feature 'User is unable to add an invalid bookmark - a flash error message is thrown' do
    scenario 'User attempts to add an invalid URL' do
      visit '/bookmark'
      click_on('add_bookmark')
      fill_in('title', :with => 'Makers')
      fill_in('bookmark', :with => 'ww.makers.tech')
      click_on('bookmark')
      expect(page).not_to have_link('Makers', href: 'ww.makers.tech')
      expect(page).to have_content('Please enter a valid URL.')
    end
  end
end