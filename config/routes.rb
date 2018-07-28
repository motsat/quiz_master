Rails.application.routes.draw do
  namespace :admin do
    get 'questions/index'
    get 'questions/new'
    get 'questions/create'
    get 'questions/destroy'
    get 'questions/update'
  end
  namespace :admin do
    resources :questions
  end
  root to: 'questions#show'

  resources :questions, only: %i(show) do
    resources :answers, only: %i(create), controller: 'questions/answers'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
