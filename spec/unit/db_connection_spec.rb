require 'db_connection'

describe DBConnection do
  describe '.setup' do
    it 'connect to test database' do
      expect(PG).to receive(:connect).with(dbname:'bookmark_manager_test')
      DBConnection.setup('bookmark_manager_test')
    end
  end

  describe '.query' do
    it 'exec sql query' do
      conn = DBConnection.setup('bookmark_manager_test')
      expect(conn).to receive(:exec).with('SELECT * FROM bookmarks;')
      DBConnection.query('SELECT * FROM bookmarks;')
    end
  end
end