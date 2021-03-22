class Bookmark
  @@bookmark_list = ["google.com","reddit.com","bbc.com"]

  def self.all
    @@bookmark_list
  end

  def initialize
    @@bookmark_list << self
  end

end
