Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :animals, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
  	resources :animal_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
  end
  root 'homes#top' #最初の画面をルートにて設定しています。
  get 'search' => 'application#search'

end
