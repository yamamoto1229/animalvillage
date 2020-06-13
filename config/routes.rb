Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :animals
  resources :users, only: [:show,:index,:edit,:update]
  root 'homes#top' #最初の画面をルートにて設定しています。
end
