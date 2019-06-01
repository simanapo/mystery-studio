Rails.application.routes.draw do
  get 'matelpage/index' => 'matelpage#index'
  root 'matelpage#index'
  # get '/posts', to: 'posts#show'
  # post '/posts/create', to: 'posts#create'
  get '/lists', to: 'mystery_lists#index'
  resource :posts
  resource :basics, only: [:show] do
    collection do
      post :answer
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
