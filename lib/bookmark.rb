require 'pg'

class Bookmark

@@bookmark_list = []
# Class methods

  def self.all
    @bookmarks = []
    conn = PG.connect( dbname: ENV['DATABASE'] )
    conn.exec( "SELECT * FROM bookmarks" ) do |result|
      result.each do |row|
        row.values_at('url').each{ |value| @bookmarks << value}
      end
    end
    conn.close if conn
    return @bookmarks
  end

  def self.print
    returnstring = ""
    Bookmark.all
    @bookmarks.each do |url|
      returnstring << "#{url}<br>"
    end
    return returnstring
  end

  def initialize
    @@bookmark_list << self
  end

end
