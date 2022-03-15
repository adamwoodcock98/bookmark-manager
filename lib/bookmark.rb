require 'pg'

class Bookmark 

  def self.all
    urls = []
    connection = PG.connect( dbname: 'bookmark_manager' )
    results = connection.exec('SELECT url FROM bookmarks')
    results.each do |row| 
      urls << row['url']
    end
    urls
  end 
  
end