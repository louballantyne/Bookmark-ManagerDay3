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
end
