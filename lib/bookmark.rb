require 'pg'

class Bookmark 

  attr_reader :title, :url, :id

  def initialize(title, url, id)
    @title = title
    @url = url
    @id = id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test' )
    else
      connection = PG.connect( dbname: 'bookmark_manager')
    end
      results = connection.exec('SELECT * FROM bookmarks')
      results.map do |row| Bookmark.new(row['title'], row['url'], row['id'])
    end
  end 

  def self.add(title, link)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test' )
    else
      connection = PG.connect( dbname: 'bookmark_manager')
    end
    result = result = connection.exec_params("INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;", [link, title])
    Bookmark.new(result[0]['title'], result[0]['url'], result[0]['id'])
  end
end