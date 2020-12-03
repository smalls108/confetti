Rails.application.routes.draw do
  get 'costume_tags/new'
  get 'costume_tags/create'
  get 'costume_tags/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :costumes do
    resources :bookings, only: [:new, :create]
  end
  get "/dashboard", to: "dashboards#dashboard", as: :dashboard

  resources :bookings, only: [] do
    member do
      post :accept
      post :reject
    end
  end

  resources :bookings, only: [] do
    resources :reviews,only: [:new, :create]
  end

   resources :costumes, only: [] do
    resources :costume_tags, only: [:new, :create]
  end

  resources :costume_tags, only: :destroy

end
