#!/bin/env ruby
# encoding: utf-8

#require 'nokogiri'
#require 'curb'
class FoodsController < ApplicationController
# GET /foods/parser
# GET /foods/parser.json
	def parser
#			Food.all.each do |food|
#							food.remove
#			end
#Food.destroy_all
	for i in 1..100 do
		food = Food.new()
	#	food.update_attributes!(:id => 1)
				#	food = Food.find(2)
					puts food.id
	   html = Curl.get("http://www.pbd-online.sk/sk/menu/welcome/detail/?id=#{i}").body_str
		      gem 'coffee-rails', '3.2.2'
				 doc = Nokogiri.HTML(html, nil, 'utf-8')		 		 
		 	#	 subor = File.open('Potraviny_name.txt','a');
		  doc.search('script').each do |nazov|
				nazov = nazov.to_s
				nazov = nazov.slice!(/h1.*h1/)
			#	puts nazov[3..nazov.size-5]
			#	subor.write(nazov[3..nazov.size-5]+"\n")
				food.update_attributes!(:name => nazov[3..nazov.size-5])
  	 end
	#	subor.close
	doc.search('.datatable tr').each do |tr|
	    a = tr.search('td')#.each do |a|
	    if "#{a.first.text.lstrip.chomp}" === 'Anglický názov potraviny'
	       food.update_attributes!(:name_eng => a.last.text.lstrip.chomp)
	    end
	    if "#{a.first.text.lstrip.chomp}" === "ENERGETICKÁ HODNOTA EÚ"
	       food.update_attributes!(:energy =>  a[2].text.lstrip.chomp)
	   end


			@foods = Food.all
    respond_to do |format|
        format.html
				format.json {render json: @foods}
		end
	end
	#	respond_to do |format|
	#					format.html{puts "<h1></h1>"} 
						
					end
#		@foods = Food.all

#		respond_to do |format|
#						format.html
#						fromat.json {render json: @foods }
	#	end
  end
				
				# GET /foods
  # GET /foods.json
  def index
			#	this.parser(1)
					@foods = Food.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @foods }
    end
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
    @food = Food.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @food }
    end
  end

  # GET /foods/new
  # GET /foods/new.json
  def new
   @food = Food.new

	#	puts "ahoj"
    respond_to do |format|
      format.html # new.html.erb
     format.json { render json: @food }
    end
  end

  # GET /foods/1/edit
  def edit
    @food = Food.find(params[:id])
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(params[:food])

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: 'Food was successfully created.' }
        format.json { render json: @food, status: :created, location: @food }
      else
        format.html { render action: "new" }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /foods/1
  # PUT /foods/1.json
  def update
    @food = Food.find(params[:id])

    respond_to do |format|
      if @food.update_attributes(params[:food])
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url }
      format.json { head :no_content }
    end
  end
end
