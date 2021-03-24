require 'pg'

class Bookmark
attr_accessor :bookmark_list, :url, :title, :id
#@@bookmark_list = []
# Class methods

  def self.all
    @bookmark_list = []
    conn = PG.connect( dbname: ENV['DATABASE'] )
    conn.exec( "SELECT * FROM bookmarks").map do |bookmark|
      @bookmark_list << Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
      #@bookmarks << "#{bookmark['title']}: #{bookmark['url']}"
    end
        #row.values_at('url').each{ |value| @bookmarks << value}
    conn.close if conn
    return @bookmark_list
  end

  def self.create(title, url)
    conn = PG.connect(dbname: ENV['DATABASE'])
    result = conn.exec("INSERT INTO bookmarks(title, url) VALUES ('#{title}', '#{url}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.print
    returnstring = ""
    Bookmark.all
    @bookmarks.each do |url|
      returnstring << "#{url}<br>"
    end
    return returnstring
  end

  def initialize(id:, title:, url: )
    @id = id
    @title = title
    @url = url
    #@@bookmark_list << self
  end

end
