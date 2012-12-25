TeamTool::Application.routes.draw do

  root to: 'teammates#index'

  resources :subteams do
    resources :assignments
    get :teammate_assignments, on: :member
  end  
  
  resources :teammates do
    resources :assignments
    get :subteam_assignments, on: :member
  end

  resources :assignments

end
