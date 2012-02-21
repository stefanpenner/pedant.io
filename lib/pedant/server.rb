require 'sinatra'
require 'fileutils'

module Pedant
  class Server < Sinatra::Application

    set :public_folder, File.dirname(__FILE__) + '/../../public'

    get '/' do
      redirect '/index.html'
    end

    post '/api/v1/repository' do
      if repo = Repository.new(params[:url])
        repo.clone!
      end
      "done"
    end
  end
end
