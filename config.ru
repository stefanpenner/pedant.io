require 'rubygems'
require 'bundler/setup'
require 'rack/contrib/static_cache'
require 'rack/rewrite'

use Rack::Rewrite do
  rewrite '/', '/index.html'
end

use Rack::StaticCache, urls: ["/"], duration: 86400, versioning: true, root: 'public'

run lambda{ |env| [ 404, { 'Content-Type'  => 'text/html' }, ['404 - page not found'] ] }
