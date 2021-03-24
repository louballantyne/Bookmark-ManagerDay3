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
    expect(page).to have_content("google")
  end



  feature 'add bookmark' do
    scenario 'user is able to add www.makers.tech' do
      visit '/bookmark'
      click_on('add_bookmark')
      fill_in('title', :with => 'Makers')
      fill_in('bookmark', :with => 'www.makers.tech')
      click_on('bookmark')
      expect(page).to have_content "www.makers.tech"
    end
  end
end
