Rails.application.routes.draw do
  root to: 'questions#show'

  resources :questions, only: %i(show) do
    resources :answers, only: %i(create), controller: 'questions/answers'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
