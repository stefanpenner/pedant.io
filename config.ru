require 'rubygems'
require 'bundler/setup'

$:.unshift File.dirname(__FILE__) + '/lib'
require 'pedant'

run Pedant::Server
