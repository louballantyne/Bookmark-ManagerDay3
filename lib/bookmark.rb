require 'pg'

class Bookmark
attr_accessor :bookmark_list, :url, :title, :id
# Class methods

  def self.all
    @bookmark_list = []
    conn = PG.connect( dbname: ENV['DATABASE'] )
    conn.exec( "SELECT * FROM bookmarks").map do |bookmark|
      @bookmark_list << Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])
    end
    conn.close if conn
    return @bookmark_list
  end

  def self.create(title, url)
    conn = PG.connect(dbname: ENV['DATABASE'])
    result = conn.exec("INSERT INTO bookmarks(title, url) VALUES ('#{title}', '#{url}') RETURNING id, title, url;")
  end

  def self.delete(id)
    conn = PG.connect(dbname: ENV['DATABASE'])
    result = conn.exec("DELETE FROM bookmarks WHERE id = '#{id}';")
  end

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def title
    @title
  end

end
