require 'bookmark'
require_relative "../helper_methods"

describe Bookmark do
  before do
    add_bookmarks
  end
  describe '#all' do
    it "returns urls from bookmark database" do
      bookmarks = Bookmark.all
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.title).to eq "Google"
      expect(bookmarks.first.url).to eq "www.google.com"
    end
  end
  describe '#create' do
    it 'can create a new bookmark' do
      bookmark = Bookmark.new('1','Makers','http://www.makers.tech')
      expect(bookmark.title).to eq "Makers"
      expect(bookmark.url).to eq "http://www.makers.tech"
    end
  end
end
