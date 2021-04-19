#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
require './lib/uploader'

options = {}
OptionParser.new do |parser|
  parser.on('-f', '--file file_name', 'The file_name of the file to upload') do |value|
    options[:file_name] = value
  end
end.parse!

uploader = ::Uploader.new
uploader.upload(options[:file_name])
