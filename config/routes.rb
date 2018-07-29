Rails.application.routes.draw do
  namespace :admin do
    resources :questions
  end
  root to: 'questions#show'

  resources :questions, only: %i(show) do
    resources :answers, only: %i(create), controller: 'questions/answers'
  end
end
