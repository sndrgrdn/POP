Studieplanner::Application.routes.draw do
  root 'application#index'
  resources :competences
  resources :learning_goals
  resources :activity
end
