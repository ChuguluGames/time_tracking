TimeTracking::Application.routes.draw do

  root to: 'home#index'

  match "/auth/:provider/callback" => "sessions#create"
  match "/login", :to => redirect("/auth/open_id?openid_url=chugulu.com"), :as => :login
  match "/signout" => "sessions#destroy", :as => :signout

  resources :projects, only: [:index]
  resources :time_tracking, only: [:index]
  resources :users, only: [:edit]

end
