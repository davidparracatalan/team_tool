TeamTool::Application.routes.draw do

  root to: 'teammates#index'

  resources :subteams do
    resources :assignments
  end  
  
  resources :teammates do
    resources :assignments
    get :availableassignmets, on: :member
  end

#  match 'teammates/:id/availableassignments' => 'Teammastes#availableassignments', :as => :availableassignments_for_teammate

end
