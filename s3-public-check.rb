#!/usr/bin/env ruby

require 'net/http'
require 'uri'

def s3get(url)

  begin
    target = URI.parse(url)
  rescue URI::InvalidURIError => err
    p err
    exit
   end

  if target.host && target.port
    http = Net::HTTP.new(target.host, target.port) 
    res = http.head("/")
    if res.code ==  "200"
      print "#{res.code} :  #{target} <-------- OPEN\n"
    end
  else
    p "Error parsing url #{target}"
  end

end


File.open('dictionary.txt', 'r') do |file|
  file.each_line do |line|
    line.chomp!
    url = "http://#{line}.s3.amazonaws.com"
    url2 = "http://s3.amazonaws.com/#{line}"
      response = s3get(url)
      response2 = s3get(url2)
  end
end 
