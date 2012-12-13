TeamTool::Application.routes.draw do

  root to: 'teammates#index'

  resources :subteams do
    resources :assignments
    get :mate_assignments, on: :member
  end  
  
  resources :teammates do
    resources :assignments
    get :team_assignments, on: :member
  end

  resources :assignments

end
