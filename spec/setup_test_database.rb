require 'pg'

p "Setting up"

def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE bookmarks;")
end

def add_test_websites
  Bookmark.add('Makers', 'http://www.makersacademy.com/')
  Bookmark.add('Google', 'http://www.google.com/')
  Bookmark.add('Destroy', 'http://www.destroyallsoftware.com')
end