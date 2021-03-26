require 'pg'

def clear_table
  conn = PG.connect( dbname: ENV['DATABASE']=='test' ? 'bookmark_manager_test' : 'bookmark_manager' )
  conn.exec( "TRUNCATE TABLE bookmarks CASCADE" )
  conn.close if conn
end

def add_bookmarks
  conn = PG.connect( dbname: ENV['DATABASE']=='test' ? 'bookmark_manager_test' : 'bookmark_manager' )
  conn.exec( "INSERT INTO bookmarks (id, url, title) VALUES ('1', 'www.google.com', 'Google')" )
  conn.exec( "INSERT INTO bookmarks (id, url, title) VALUES ('2', 'www.destroyallsoftware.com', 'Destroy All Software')" )
  conn.exec( "INSERT INTO bookmarks (id, url, title) VALUES ('3', 'www.makersacademy.com','Makers')" )
  conn.close if conn
end
