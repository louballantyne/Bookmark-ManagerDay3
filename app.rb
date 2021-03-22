require 'sinatra/base'

class BookmarksManager < Sinatra::Base

enable :sessions

  get '/' do
    "Hello World!"
    erb(:index)
  end

  run! if app_file == $0

end
