require 'pg'
require './lib/database_connection'

class Bookmark 

  attr_reader :title, :url, :id

  def initialize(title, url, id)
    @title = title
    @url = url
    @id = id
  end

  def self.all
    connection = DatabaseConnection.connect
    results = connection.exec('SELECT * FROM bookmarks')
    results.map { |row| Bookmark.new(row['title'], row['url'], row['id']) }
  end 

  def self.add(title, link)
    connection = DatabaseConnection.connect
    result = connection.exec_params("INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;", [link, title])
    Bookmark.new(result[0]['title'], result[0]['url'], result[0]['id'])
  end

  def self.delete(id:)
    connection = DatabaseConnection.connect
    connection.exec("DELETE FROM bookmarks WHERE id = #{id};")
  end

  def self.find(id:)
    connection = DatabaseConnection.connect
    result = connection.exec("SELECT * FROM bookmarks WHERE id = #{id};")
    Bookmark.new(result[0]['title'], result[0]['url'], result[0]['id'])
  end
end