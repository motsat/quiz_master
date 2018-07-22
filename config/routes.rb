Rails.application.routes.draw do
  root to: 'questions#show'

  namespace :questions do
    resources 'questions', only: %i(create)
  end
  resources 'questions', only: %i(show)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
