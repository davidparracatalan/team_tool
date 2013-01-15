TeamTool::Application.routes.draw do
  
  root to: 'teammates#index'

  resources :subteams do
    resources :assignments
  end  
  
  resources :teammates do
    resources :assignments
  end

  resources :assignments

end
