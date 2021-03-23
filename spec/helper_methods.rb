require 'pg'

def clear_table
  conn = PG.connect( dbname: ENV['DATABASE'] )
  conn.exec( "TRUNCATE TABLE bookmarks" )
  conn.close if conn
end

def add_bookmarks
  conn = PG.connect( dbname: ENV['DATABASE'] )
  conn.exec( "INSERT INTO bookmarks VALUES ('1','www.google.com')" )
  conn.exec( "INSERT INTO bookmarks VALUES ('2','www.destroyallsoftware.com')" )
  conn.exec( "INSERT INTO bookmarks VALUES ('3','www.makersacademy.com')" )
  conn.close if conn
end
