ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

require 'rubygems'

require 'optparse'
require 'sinatra/base'
require 'mongoid'

class Main < Sinatra::Base
  enable :dump_errors, :logging, :static
  
  set :app_file, File.join(File.dirname(__FILE__), "mrhyde.rb")
  set :root, File.join(File.dirname(__FILE__), "mrhyde")
  set :post_login_redirect, "/" 
  use Rack::Session::Cookie
end

require 'haml'
require 'jekyll'
require 'ruby-debug'

require 'mrhyde/mrhyde'
require 'mrhyde/main'
