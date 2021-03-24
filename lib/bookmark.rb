require 'pg'

class Bookmark

@@bookmark_list = []
# Class methods

  def self.all
    @bookmarks = []
    conn = PG.connect( dbname: ENV['DATABASE'] )
    conn.exec( "SELECT * FROM bookmarks").map do |bookmark|
      @bookmarks << "#{bookmark['title']}: #{bookmark['url']}"
    end
        #row.values_at('url').each{ |value| @bookmarks << value}
    conn.close if conn
    return @bookmarks
  end

  def self.create(title, url)
    conn = PG.connect(dbname: ENV['DATABASE'])
    conn.exec("INSERT INTO bookmarks(title, url) VALUES ('#{title}', '#{url}')")
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
