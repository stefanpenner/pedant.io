require 'sinatra'
require 'fileutils'

module Pedant
  class Server < Sinatra::Application

    set :public_folder, File.dirname(__FILE__) + '/../../public'

    get '/' do
      redirect '/index.html'
    end

    post '/api/v1/project' do
      if repo = Project.find_or_create(params[:url])
        repo.clone!
      end
      "done"
    end
  end
end
