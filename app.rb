require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark'

class Bookmark_Manager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do 
    erb(:index)
  end 

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  get '/bookmarks/add' do
    erb(:add)
  end 

  post '/bookmarks/add' do
    Bookmark.add(params[:title], params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks/view' do
    session[:id] = params[:id_to_delete]
    @bookmark = Bookmark.find(id: session[:id])
    erb(:view)
  end 

  post '/bookmarks/delete' do
    Bookmark.delete(id: session[:id])
    redirect '/bookmarks'
  end
  
  run! if app_file == $0
end