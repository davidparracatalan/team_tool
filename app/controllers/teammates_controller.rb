class TeammatesController < ApplicationController

  def index
    @teammates = Teammate.all
  end

  def show
    @teammate = Teammate.find(params[:id])
  end

  def new
    @teammate = Teammate.new
  end

  def edit
    @teammate = Teammate.find(params[:id])
  end

  def create
    @teammate = Teammate.new(params[:teammate])

    if @teammate.save
      redirect_to @teammate, notice: 'Teammate was successfully created.'
    else
      render action: "new" 
    end
  end

  def update
    @teammate = Teammate.find(params[:id])

    if @teammate.update_attributes(params[:teammate])
      redirect_to @teammate, notice: 'Teammate was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @teammate = Teammate.find(params[:id])
    @teammate.destroy

    redirect_to teammates_url
  end

  def subteam_assignments
    @teammate = Teammate.find(params[:id])
    @subteams_for_teammate = @teammate.subteams
    @available_subteams = Subteam.find(:all) - @subteams_for_teammate
    render :action => 'subteam_assignments'
  end

  def assign_to_subteam
    @teammate = Teammate.find(params[:id])
    @teammate.assign_to!(params[:subteam])
  end
end
