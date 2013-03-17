#!/bin/env ruby
# encoding: utf-8
require 'curb'
require 'nokogiri'

class Regis < ApplicationController
	def self.parse(id)
	   html = Curl.get("http://www.pbd-online.sk/sk/menu/welcome/detail/?id=#{id}").body_str
     gem 'coffee-rails', '3.2.2'
	   doc = Nokogiri.HTML(html, nil, 'utf-8')
		 
		 subor = File.open('Potraviny_name.txt','a');

		 #subor.write("ahoj")
		 #subor.write("bubo")
		 doc.search('script').each do |nazov|
						 nazov = nazov.to_s
						 nazov = nazov.slice!(/h1.*h1/)
						 puts nazov[3..nazov.size-5]
						 subor.write(nazov[3..nazov.size-5]+"\n")
  	 end

		 subor.close
		# pocitadlo = 1

	   doc.search('.datatable tr').each do |tr|
		 tr.search('td').each do |a|
	   puts a.text
		 Food.new
		 end
	   # if(pocitadlo == 1)
		#						 puts "Základná skupina: #{cells.first.text} #{tr.search('.r1')[0..5]}"
		  end
		#	pocitadlo += 1
	  # when "Obchodné meno:" then
	  #puts "Meno: #{cells.last.text}"
     
   # end
  end
end

for i in 1..5
Regis.parse(i)
end
