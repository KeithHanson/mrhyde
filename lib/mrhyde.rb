ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

require 'rubygems'
require 'haml'
require 'evri_rpx'
require 'jekyll'
require 'ruby-debug'

require File.join(ROOT_DIR, "mrhyde", "mrhyde.rb")
require File.join(ROOT_DIR, "mrhyde", "main.rb")

begin
  MrHyde::Comment.all.count
  Main.run! if Main.run?
rescue
  puts "FAIL: Please ensure your Redis server is running."
end
