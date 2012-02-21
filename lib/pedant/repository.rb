module Pedant
  class Repository
    attr_reader :url, :cloned, :account, :repo
    include FileUtils

    def initialize(url)
      @url = url
      @cloned = false
      @account, @repo = @url.split('/')
    end

    def path
      [pwd,'tmp', @url].join('/')
    end

    def clone!
      rm_rf!
      cd 'tmp' do
        mkdir_p account
        cd account do
          system "git clone https://github.com/#{@url}.git > /dev/null 2> /dev/null"
        end
        @cloned = true
      end
    end

    def rm_rf!
      cd 'tmp' do
        rm_rf @url
      end
    end
  end
end
