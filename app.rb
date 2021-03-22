require 'sinatra/base'

class BookmarksManager < Sinatra::Base

  enable :sessions

  get '/' do
    "Hello World!"
    erb(:index)
  end

  get '/bookmark' do
    erb(:bookmark)
  end

  run! if app_file == $0

end
