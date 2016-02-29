require 'rubygems'
require 'bundler/setup'
require 'active_support/time'

require 'sinatra'
require 'sinatra/activerecord'
require 'tilt/haml'
require 'json'
require 'time'

Dir['./model/*.rb'].each {|file| require file }
Dir['./model/operation/*.rb'].each {|file| require file }