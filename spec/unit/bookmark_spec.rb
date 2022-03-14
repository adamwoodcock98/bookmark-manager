require 'bookmark'

describe Bookmark do 
  
  it "returns list of all bookmarks" do
    expect(Bookmark.all).to eq ['https://www.google.com']
  end 

end