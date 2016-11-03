require 'nokogiri'
require 'open-uri'

#puts "enter URL:"
# url = gets.strip

url = "https://www.ptv.vic.gov.au/live-travel-updates/"
html_doc = Nokogiri::HTML(open(url))
#characters = @doc.css("sitcoms name")
puts html_doc