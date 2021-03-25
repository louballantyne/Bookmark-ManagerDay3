require 'sinatra/base'
require 'pg'
require_relative 'lib/bookmark'
require_relative 'db_connect_helper'
require 'sinatra/flash'
require 'uri'

class BookmarksManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

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
    if params[:bookmark]=~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.create(params[:title], params[:bookmark])
      redirect '/bookmark'
    else
      flash[:warning] = "Please enter a valid URL."
      redirect '/new_bookmark'
    end
  end

  delete '/bookmark/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmark'
  end

  get '/bookmark/:id/edit' do
    @id = params[:id]
    erb(:edit_bookmark)
  end

  put '/bookmark/:id' do
    Bookmark.update(params[:id],params[:url],params[:title])
    redirect '/bookmark'
  end


  run! if app_file == $0

end
