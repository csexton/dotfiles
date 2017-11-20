#!/usr/bin/env ruby
#
# LaunchBar Action Script
#
# Writes the arguments to the clipboard with no trailing newline.
#
require 'open3'

Open3.popen3("pbcopy") do |stdin, stdout, stderr, wait_thr|
  stdin.write ARGV.join ' '
  stdin.close
end
