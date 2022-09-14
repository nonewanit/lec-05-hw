Rails.application.routes.draw do
  root "main#home"
  get 'score/list'
  post 'score/list'
  get 'score/edit'
  post 'score/edit'
  get 'main/home'
  post 'main/home'
  get 'main/test'
  post 'main/test'
  get 'main/test2'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
