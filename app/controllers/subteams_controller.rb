class SubteamsController < ApplicationController

  def index
    @subteams = Subteam.all
  end

  def show
    @subteam = Subteam.find(params[:id])
  end

  def new
    @subteam = Subteam.new
  end

  def edit
    @subteam = Subteam.find(params[:id])
  end

  def create
    @subteam = Subteam.new(params[:subteam])
    if @subteam.save
      redirect_to @subteam, notice: 'Subteam was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @subteam = Subteam.find(params[:id])
    if @subteam.update_attributes(params[:subteam])
      redirect_to @subteam, notice: 'Subteam was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @subteam = Subteam.find(params[:id])
    @subteam.destroy
    redirect_to subteams_url
  end
end
