require 'daemons'
require File.expand_path('vendor/autoload')

Daemons.run('monitoring.rb')