#!/usr/bin/env ruby
#
# LaunchBar Action Script
#
#require 'json'
#
#items = []
#
#ARGV.each do | argument |
#    item = {}
#    item['title'] = argument
#    items.push(item)
#    item = {}
#    item['title'] = argument + argument
#    items.push(item)
#end
#
#puts items.to_json

require "open-uri"
require "json"
require "cgi"
q = CGI.escape(ARGV.join " ")

suggestions = open("https://www.google.com/complete/search?output=toolbar&q=#{q}")
.read
.scan(/data=\"([^"]*)\"/)
.flatten

result = []
suggestions.each do |suggestion|
    description = suggestion
    item = {}
    item['title'] = suggestion
    item['name'] = suggestion
    item['url'] = ''
    item['icon'] = ''

    # Limit the length of the description, which is usually very long:
    max_description_length = 100
    item['subtitle'] = description[0, max_description_length]
    item['subtitle'] += '…' if description.length > max_description_length

    item['action'] = 'copy.rb'
    item['actionArgument'] = suggestion

    result.push(item)
end



# Output the array of result items in JSON so LaunchBar can parse it:
puts result.to_json

