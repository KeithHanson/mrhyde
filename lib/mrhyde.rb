ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

require 'rubygems'
require 'haml'
require 'sinatra/base'
require 'ohm'
require 'evri_rpx'

class Main < Sinatra::Base
  enable :dump_errors, :logging, :static
  
  set :app_file, __FILE__
  set :root, File.join(ROOT_DIR, "mrhyde")
  set :run, true
  use Rack::Session::Cookie
  # set :port, 80
  set :blog_name, "YOUR BLOG NAME HERE"
  set :rpx_url, "https://mrhyde.rpxnow.com/openid/v2/signin?token_url=http://rubyengineer.com/rpx_token_url"
  
  def self.rpx
    debugger
    @@rpx ||= Evri::RPX::Session.new(YOUR_API_KEY_HERE)
  end
  
end

require File.join(ROOT_DIR, "mrhyde", "main.rb")

Main.run! if Main.run?