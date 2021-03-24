require 'bookmark'
require_relative "../helper_methods"

describe Bookmark do
  before do
    add_bookmarks
  end
  describe '#all' do
    it "returns urls from bookmark database" do
      expect(Bookmark.all).to include("Google: www.google.com")
    end
  end
  describe '#print' do
    it 'returns a string containing appropriate formatting' do
      expect(Bookmark.print).to include("www.google.com<br>")
    end
  end
  describe '#create' do
    it 'can create a new bookmark' do
      Bookmark.create('Makers','http://www.makers.tech')
      expect(Bookmark.all).to include "Makers: http://www.makers.tech"
    end
  end
end
