require 'pg'

class Bookmark
attr_accessor :bookmark_list, :url, :title, :id
# Class methods

  def self.all
    @bookmark_list = []
    conn = PG.connect( dbname: dbname )
    conn.exec( "SELECT * FROM bookmarks").map do |bookmark|
      @bookmark_list << Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])
    end
    conn.close if conn
    return @bookmark_list
  end

  def self.create(title, url)
    conn = PG.connect(dbname: dbname)
    result = conn.exec("INSERT INTO bookmarks(title, url) VALUES ('#{title}', '#{url}') RETURNING id, title, url;")
  end

  def self.delete(id)
    conn = PG.connect(dbname: dbname)
    result = conn.exec("DELETE FROM bookmarks WHERE id = '#{id}';")
  end

  def self.find(id)
    @bookmark_list.each do |bookmark|
      return bookmark if bookmark.id == id 
    end
  end
  
  def self.update(id,url,title)
    p '-----------------------'
    p 'update bookmark'
    p '-----------------------'
    p id, url, title
    conn = PG.connect(dbname: dbname)
    result = conn.exec("UPDATE bookmarks SET url='#{url}', title='#{title}' WHERE id = '#{id}';")
  end
  
  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.dbname
    ENV['DATABASE'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  end

end
