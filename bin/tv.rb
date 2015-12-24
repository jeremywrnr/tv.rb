#!/usr/bin/env ruby


Version = 0.1
require 'terminfo'
require_relative '../lib/tv'


# tv.rb (maybe) emulates a retro tv's fuzzy flashing.
# otherwise just some trippy terminal art that's fun.
# by jeremy warner, december 2015


# go run or test
TV.new(ARGV.first)

