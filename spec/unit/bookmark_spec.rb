require 'bookmark'

describe Bookmark do 
  
  describe ".all" do
    it "returns list of all bookmarks" do
      bookmark = Bookmark.add('Makers', 'http://www.makersacademy.com')
      Bookmark.add('Google', 'http://www.google.com')
      Bookmark.add('Destroy', 'http://www.destroyallsoftware.com')

      bookmarks = Bookmark.all
   
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end 
  end

  describe ".add" do
    it 'adds a new bookmark' do
      bookmark = Bookmark.add("Google", "www.google.com") # Using a tuple from the PG gem
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id}")

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Google'
      expect(bookmark.url).to eq "www.google.com"
    end
  end

end