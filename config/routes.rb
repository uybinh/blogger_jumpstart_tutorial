Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
  end
  resources :tags
  root to: "articles#index"
  resources :authors

  resources :author_sessions, only: [:new, :create, :destroy]
  get 'login' => 'author_sessions#new'
  post 'login' => 'author_sessions#create'
  get 'logout' => 'author_sessions#destroy'
end
