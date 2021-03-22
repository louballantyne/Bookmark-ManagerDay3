class Bookmark
  @@bookmark_list = []

  def self.all
    @@bookmark_list
  end

  def initialize
    @@bookmark_list << self
  end

end
