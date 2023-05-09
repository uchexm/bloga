Rails.application.routes.draw do
  resources :comments
  resources :likes
  resources :posts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  get 'users' => 'users#index', as: 'users'
  get 'users/:id' => 'users#show', as: :user
  get 'users/:id/posts' => 'posts#index', as: :user_posts
  get 'users/:id/posts/:post_id' => 'posts#show', as: :user_post
end
