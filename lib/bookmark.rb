require_relative 'db_connection'

class Bookmark
attr_accessor :bookmark_list, :url, :title, :id
# Class methods

  def self.all
    @bookmark_list = []
    DBConnection.connection.exec( "SELECT * FROM bookmarks").map do |bookmark|
      @bookmark_list << Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])
    end
    return @bookmark_list
  end

  def self.create(title, url)
    DBConnection.connection.exec("INSERT INTO bookmarks(title, url) VALUES ('#{title}', '#{url}') RETURNING id, title, url;")
  end

  def self.delete(id)
    DBConnection.connection.exec("DELETE FROM bookmarks WHERE id = '#{id}';")
  end

  def self.find(id)
    @bookmark_list.each do |bookmark|
      return bookmark if bookmark.id == id 
    end
  end
  
  def self.update(id,url,title)
    DBConnection.connection.exec("UPDATE bookmarks SET url='#{url}', title='#{title}' WHERE id = '#{id}';")
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
