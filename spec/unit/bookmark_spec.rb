require 'bookmark'

describe Bookmark do 
  
  describe ".all" do
    it "returns list of all bookmarks" do

      Bookmark.add('Makers', 'http://www.makersacademy.com/')
      Bookmark.add('Google', 'http://www.google.com/')
      Bookmark.add('Destroy', 'http://www.destroyallsoftware.com')

      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.makersacademy.com/')
      expect(bookmarks).to include('http://www.google.com/')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
    end 
  end

  describe ".add" do
    it 'adds a new bookmark' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.add('Test', 'http://www.test.com')
      expect(Bookmark.all).to include('http://www.test.com')
    end
  end

end