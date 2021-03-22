require_relative "../../app"

feature 'Homepage' do
  scenario 'User navigates to homepage and sees title' do
    visit '/'
    expect(page).to have_text "Bookmark Manager"
  end
end
