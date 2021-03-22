require 'pg'
class DatabaseManager
  def initialize
    conn = PG.connect( dbname: 'bookmark_manager', user: 'lou' )
    conn.exec( "SELECT * FROM bookmarks" ) do |result|
      puts "     id | url   "
      result.each do |row|
      puts " %7d | %-16s " %
      row.values®_at('id', 'url')
    end
    end
  end
end

database = DatabaseManager.new
puts database
