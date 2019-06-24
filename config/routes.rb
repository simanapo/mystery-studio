Rails.application.routes.draw do
  devise_for :users
  root 'logins#index'
  # get 'matelpage/index' => 'matelpage#index'
  # root 'matelpage#index'
  # get '/posts', to: 'posts#show'
  # post '/posts/create', to: 'posts#create'
  get '/mystery_lists', to: 'mystery_lists#index'
  # resource :mystery_lists
  resource :posts do
    collection do
      get :list
    end
  end
  resource :basics, only: [:show] do
    collection do
      post :answer
    end
  end
  resource :questions, only: [:show] do
    collection do
      post :answer
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
