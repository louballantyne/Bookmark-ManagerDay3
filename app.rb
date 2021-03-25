require 'sinatra/base'
require 'pg'
require_relative 'lib/bookmark'

class BookmarksManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    erb(:index)
  end

  get '/bookmark' do
    erb(:bookmark)
  end

  get '/new_bookmark' do
    erb :new_bookmark
  end

  post '/add_bookmark' do
    Bookmark.create(params[:title], params[:bookmark])
    redirect '/bookmark'
  end

  delete '/bookmark/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmark'
  end


  run! if app_file == $0

end
