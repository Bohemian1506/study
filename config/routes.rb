Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    
  # Defines the root path route ("/")
  # root "articles#index"
    root 'static_pages#top'
    resources :users, only: %i[new create]
    resources :boards, only: %i[index new create show edit update destroy] do
      resources :comments, only: %i[create edit destroy], shallow: true
      collection do
        get :bookmarks
      end
    end
    resources :bookmarks, only: %i[create destroy]
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
end
