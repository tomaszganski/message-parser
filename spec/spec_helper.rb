require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../app.rb', __FILE__

require File.dirname(__FILE__)+"/support/custom_matcher.rb"

module RSpecMixin
  include Rack::Test::Methods
  def app() App.new end
end

RSpec.configure do |config|
  config.include RSpecMixin
  require 'database_cleaner'

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation #, {:only => %w{LIST OF TABLES HERE} }
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each, :database) do
    # open transaction
    DatabaseCleaner.start
  end

  config.after(:each, :database) do
    DatabaseCleaner.clean
  end

  config.before(:suite) do
    load File.expand_path '../../db/seeds.rb', __FILE__
  end
end
