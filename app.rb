require 'slim'
require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:///foo.db'

class Todo < ActiveRecord::Base
  validates_presence_of :name

  def toggle
    if complited_at
      self.complited_at = nil
    else
      self.complited_at = Time.now
    end

    save
  end
end

get '/' do
  @todos = Todo.all
  slim :index
end

post '/todos' do
  @todo = Todo.create(name: params[:todo][:name])
  redirect '/'
end

post '/todos/:id/toggle' do
  @todo = Todo.find params[:id]
  @todo.toggle
  redirect '/'
end
