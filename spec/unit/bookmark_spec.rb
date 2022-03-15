require 'bookmark'

describe Bookmark do 
  
  describe ".all" do
    it "returns list of all bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")

      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.makersacademy.com/')
      expect(bookmarks).to include('http://www.google.com/')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
    end 
  end

  describe ".add" do
    it 'adds a new bookmark' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.add('http://www.test.com')
      expect(Bookmark.all).to include('http://www.test.com')
    end
  end

end