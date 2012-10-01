TeamTool::Application.routes.draw do

  resources :subteams
  resources :teammates

  root to: 'teammates#index'

end
