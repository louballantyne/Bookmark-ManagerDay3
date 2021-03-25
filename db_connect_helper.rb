require './lib/db_connection'

dbname = (ENV['DATABASE'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager')
DBConnection.setup(dbname)