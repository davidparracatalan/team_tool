class SubteamsController < ApplicationController
  # GET /subteams
  # GET /subteams.json
  def index
    @subteams = Subteam.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subteams }
    end
  end

  # GET /subteams/1
  # GET /subteams/1.json
  def show
    @subteam = Subteam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subteam }
    end
  end

  # GET /subteams/new
  # GET /subteams/new.json
  def new
    @subteam = Subteam.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subteam }
    end
  end

  # GET /subteams/1/edit
  def edit
    @subteam = Subteam.find(params[:id])
  end

  # POST /subteams
  # POST /subteams.json
  def create
    @subteam = Subteam.new(params[:subteam])

    respond_to do |format|
      if @subteam.save
        format.html { redirect_to @subteam, notice: 'Subteam was successfully created.' }
        format.json { render json: @subteam, status: :created, location: @subteam }
      else
        format.html { render action: "new" }
        format.json { render json: @subteam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subteams/1
  # PUT /subteams/1.json
  def update
    @subteam = Subteam.find(params[:id])

    respond_to do |format|
      if @subteam.update_attributes(params[:subteam])
        format.html { redirect_to @subteam, notice: 'Subteam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subteam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subteams/1
  # DELETE /subteams/1.json
  def destroy
    @subteam = Subteam.find(params[:id])
    @subteam.destroy

    respond_to do |format|
      format.html { redirect_to subteams_url }
      format.json { head :no_content }
    end
  end
end
