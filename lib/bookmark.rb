class Bookmark

  require 'pg'

  def self.all
    conn = PG.connect( dbname: 'bookmark_manager' )
    conn.exec( "SELECT * FROM bookmarks" ) do |result|
      puts "Bookmarks:"
        result.each do |row|
          puts "%-16s" %
          row.values_at('url')
        end
    end 
  end

  def initialize
    @@bookmark_list << self
  end

end
