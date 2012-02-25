require 'ruby-git'
module Pedant
  class Project
    attr_reader :url, :cloned, :account, :repo
    include FileUtils

    def initialize(url)
      @url = url
      @cloned = false
      @account, @repo = @url.split('/')
    end

    def self.find_or_create(url)
      new(url)
    end

    def path
      [pwd,'tmp', url].join('/')
    end

    def clone!
      rm_rf!
      Git.repo(path).klone("https://github.com/#{url}.git")

      @cloned = true
    end

    def rm_rf!
      cd 'tmp' do
        rm_rf @account
      end
    end
  end
end
