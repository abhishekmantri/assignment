Rails.application.routes.draw do
  resources :posts
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'login' => 'users#login'
  post 'signup' => 'users#create'
  delete 'logout' => 'users#logout'
end
