class AssignmentsController < ApplicationController

  def create
    @assignment = Assignment.new(params[:teammate_id], params[:subteam_id])
    @assignment.save
  end
end