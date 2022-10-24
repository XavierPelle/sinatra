require 'bundler'
Bundler.require
require_relative 'gossip'


class ApplicationController < Sinatra::Base
  get '/' do
    erb :index , locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :gossip_new
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect "/"
  end

  get '/gossip/:id/' do
    erb :gossip_id, locals: {gossip: Gossip.all}
  end

  get '/gossip/:id/edit/' do
    erb :edit, locals: {gossip: Gossip.all}
  end

  post '/gossip/:id/edit/' do
    puts "Ceci est le contenu du hash params : #{params}"
    Gossip.new(params["gossip_author"], params["gossip_content"], params["id"]).save
    redirect back
  end

end