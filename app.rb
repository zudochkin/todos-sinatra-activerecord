require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///foo.db'

class Todo < ActiveRecord::Base
  validates_presence_of :name
end

get '/todos' do
  @todos = Todo.scoped
  erb :index
end

post '/todos' do
  @todo = Todo.create(:name => params[:todo][:name])
  redirect '/todos'
end




