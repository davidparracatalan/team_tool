TeamTool::Application.routes.draw do

  resources :subteams do
    resources :assignments
  end  
  
  resources :teammates do
    resources :assignments
  end

  root to: 'teammates#index'

end
