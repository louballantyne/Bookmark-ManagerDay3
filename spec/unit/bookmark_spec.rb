require 'bookmark'

describe Bookmark do
  it 'stores all instances in a class variable' do
    google = Bookmark.new
    linkedin = Bookmark.new
    expect(Bookmark.all).to include(google, linkedin)
  end
end
