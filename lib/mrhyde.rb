ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

require 'rubygems'
require 'haml'
require 'ohm'
require 'evri_rpx'
require 'jekyll'
require 'ruby-debug'

require File.join(ROOT_DIR, "mrhyde", "mrhyde.rb")
require File.join(ROOT_DIR, "mrhyde", "main.rb")

Main.run! if Main.run?