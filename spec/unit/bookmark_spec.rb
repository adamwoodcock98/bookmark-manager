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
      persisted_data = persisted_data(bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Google'
      expect(bookmark.url).to eq "www.google.com"
    end
  end

  describe ".delete" do
    it "deletes an existing bookmark" do
      bookmark = Bookmark.add("Google", "www.google.com")
      Bookmark.delete(id: bookmark.id)
      expect(persisted_data(bookmark.id)).to be nil
    end 
  end 

  describe ".find" do
    it "filters table to find bookmark" do
      bookmark = Bookmark.add("Google", "www.google.com")
      found_bookmark = Bookmark.find(id: bookmark.id)

      expect(found_bookmark).to be_a Bookmark
      expect(found_bookmark.id).to eq bookmark.id
      expect(found_bookmark.title).to eq 'Google'
      expect(found_bookmark.url).to eq 'www.google.com'
    end 
  end 

  describe ".update" do
    it "updates an existing bookmark" do
      bookmark = Bookmark.add("Google", "www.google.com")
      Bookmark.update(id: bookmark.id, title: "Google 2.0", url: "www.thenewgoogle.com")

      updated_bookmark = persisted_data(bookmark.id)

      expect(updated_bookmark["title"]).to eq "Google 2.0"
      expect(updated_bookmark["url"]).to eq "www.thenewgoogle.com"
    end
  end

end