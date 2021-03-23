require 'bookmark'

describe Bookmark do
  describe '#all' do
    it "returns urls from bookmark database" do
      expect(Bookmark.all).to include("www.google.com")
    end
  end
end
