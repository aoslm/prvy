class AsController < ApplicationController
  # GET /as
  # GET /as.json
  def index
    @as = A.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @as }
    end
  end

  # GET /as/1
  # GET /as/1.json
  def show
    @a = A.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @a }
    end
  end

  # GET /as/new
  # GET /as/new.json
  def new
    @a = A.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @a }
    end
  end

  # GET /as/1/edit
  def edit
    @a = A.find(params[:id])
  end

  # POST /as
  # POST /as.json
  def create
    @a = A.new(params[:a])

    respond_to do |format|
      if @a.save
        format.html { redirect_to @a, notice: 'A was successfully created.' }
        format.json { render json: @a, status: :created, location: @a }
      else
        format.html { render action: "new" }
        format.json { render json: @a.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /as/1
  # PUT /as/1.json
  def update
    @a = A.find(params[:id])

    respond_to do |format|
      if @a.update_attributes(params[:a])
        format.html { redirect_to @a, notice: 'A was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @a.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /as/1
  # DELETE /as/1.json
  def destroy
    @a = A.find(params[:id])
    @a.destroy

    respond_to do |format|
      format.html { redirect_to as_url }
      format.json { head :no_content }
    end
  end
end
