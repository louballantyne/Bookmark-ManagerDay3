require 'pg'

def clear_table
  conn = PG.connect( dbname: ENV['DATABASE']=='test' ? 'bookmark_manager_test' : 'bookmark_manager' )
  conn.exec( "TRUNCATE TABLE bookmarks" )
  conn.close if conn
end

def add_bookmarks
  conn = PG.connect( dbname: ENV['DATABASE']=='test' ? 'bookmark_manager_test' : 'bookmark_manager' )
  conn.exec( "INSERT INTO bookmarks (url, title) VALUES ('www.google.com', 'Google')" )
  conn.exec( "INSERT INTO bookmarks (url, title) VALUES ('www.destroyallsoftware.com', 'Destroy All Software')" )
  conn.exec( "INSERT INTO bookmarks (url, title) VALUES ('www.makersacademy.com','Makers')" )
  conn.close if conn
end
