class AssignmentsController < ApplicationController

  def index
    if params[:teammate_id]
      @teammate = Teammate.find(params[:teammate_id])
      @assignments_for_teammate = @teammate.assignments
    end
  end

  def create
    @assignment = Assignment.new(params[:assignment])
    @teammate = Teammate.find(params[:assignment][:teammate_id])
    @available_subteams = @teammate.subteams_not_assigned_to_me
    
    if @assignment.save      
      redirect_to teammate_assignments_path(@teammate)
    else
      render :new
    end
  end

  def new
    @assignment = Assignment.new
    @teammate = Teammate.find(params[:teammate_id])
    @available_subteams = @teammate.subteams_not_assigned_to_me
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    teammate = @assignment.teammate
    @assignment.destroy
    redirect_to teammate_assignments_path(teammate)
  end
end