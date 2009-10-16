#!/usr/bin/env ruby
require "mrhyde"

Main.set :run, false
Main.set :environment, :production

Main.set :rpx_key, "YOUR_RPX_KEY"

run Main
