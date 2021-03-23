require_relative "../../app"

feature 'Homepage' do
  scenario 'User navigates to homepage and sees title' do
    visit '/'
    expect(page).to have_text "Bookmark Manager"
  end
end

feature '/bookmark' do
  scenario 'should serve bookmark page' do
    visit '/bookmark'
    expect(page).to have_content("Your Bookmarks:")
    expect(page).to have_content("google")
  end
end
