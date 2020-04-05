Rails.application.routes.draw do

  devise_for :admins, controllers: { registrations: "registrations"}
  mount Ckeditor::Engine => '/ckeditor'
  get 'posts/index'
  get 'posts/new'
  get 'posts/create'
  get 'posts/showrandom'

  root 'posts#index'
  resources :works, only: [:index, :show, :create, :destroy]
  resources :archives, only: [:show, :index]
  resources :posts, only: [:create, :show, :destroy, :index, :feed]
  get 'tags/:tag', to: 'posts#index', as: "tag"
  resources :feeds, only: [:index]

end
