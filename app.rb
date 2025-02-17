require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/peepviewer'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/view_peeps' do
    @all_peeps = PeepViewer.all
    erb :view_peeps
  end

  post '/view_peeps/add' do
    PeepViewer.add(message: params['message'])
    redirect '/view_peeps'
  end

  run! if app_file == $0
end
