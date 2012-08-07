#!/usr/bin/ruby
# gem install ruby-nmap

require 'nmap/program'

NETWORK = ARGV[0]

Nmap::Program.scan do |nmap|
    print "Scanning #{NETWORK}..."
    #nmap.sudo = true

    nmap.syn_scan = true
    nmap.service_scan = true
    nmap.os_fingerprint = true
    nmap.xml = "#{NETWORK}.xml"
    nmap.verbose = true

    nmap.ports = [20,21,22,23,25,80,110,443,512,522,8080,8081,1080]
    nmap.targets = "#{NETWORK}"
end

