#!/usr/bin/env ruby
#
# Copyright (c) 2014 Objective Development Software GmbH
# http://www.obdev.at/

def connect_to_vpn(vpn_name)
    `/usr/sbin/networksetup -connectpppoeservice "#{vpn_name}"`
end

def disconnect_from_vpn(vpn_name)
    `/usr/sbin/scutil --nc stop "#{vpn_name}"`
end

def is_vpn_connected(vpn_name)
    output = `/usr/sbin/scutil --nc status "#{vpn_name}" | /usr/bin/head -1`
    output.start_with?("Connected")
end

vpn_name = ARGV[0]
if is_vpn_connected(vpn_name) then
    disconnect_from_vpn(vpn_name)
else
    connect_to_vpn(vpn_name)
end
