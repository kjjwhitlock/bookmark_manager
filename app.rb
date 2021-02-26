require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Hello'
  end

  get '/bookmarks' do
    @list = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmark.create(params[:url], params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
