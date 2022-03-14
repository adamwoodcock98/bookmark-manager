require 'bookmark'

describe Bookmark do 
  
  describe ".all" do
    it "returns list of all bookmarks" do
      bookmarks = Bookmark.all
      expect(bookmarks).to include('https://www.kathleen.com')
      expect(bookmarks).to include('https://www.christian.com')
    end 
  end

end