require 'bookmark'

describe Bookmark do
  describe '#all' do
    it "returns all url's from bookmark database" do
      expect(Bookmark.all).to include("http://www.google.com")
    end 
  end
end
