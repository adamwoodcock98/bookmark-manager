require 'pg'

def persisted_data(id)
  connection = DatabaseConnection.connect
  result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
  result.first
end