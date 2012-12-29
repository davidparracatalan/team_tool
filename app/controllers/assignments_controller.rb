class AssignmentsController < ApplicationController

  def create
    @assignment = Assignment.new(:teammate_id => params[:teammate_id], 
                                 :subteam_id => params[:subteam_id])
    @teammate = Teammate.find(params[:teammate_id])

    if @assignment.save
      redirect_to subteam_assignments_teammate_path(@teammate)
    else
      render :action => "new"
    end

  end

  def new
    @assignment = Assignment.new
    @teammate = Teammate.find_by_id(params[:teammate_id])
    @subteam = Subteam.find_by_id(params[:subteam_id])
  end


  def destroy
    @assignment = Assignment.find(params[:id])
    teammate = @assignment.teammate
    @assignment.destroy
    redirect_to subteam_assignments_teammate_path(teammate)
  end
end