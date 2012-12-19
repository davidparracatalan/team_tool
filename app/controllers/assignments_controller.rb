class AssignmentsController < ApplicationController

  def create
    @assignment = Assignment.new(params[:teammate_id], params[:subteam_id])
    @assignment.save
  end

  def new
    @assignment = Assignment.new
    @teammate = Teammate.find_by_id(params[:teammate_id])
    @subteam = Subteam.find_by_id(params[:subteam_id])
  end
end