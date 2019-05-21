Rails.application.routes.draw do
  get 'matelpage/index' => 'matelpage#index'
  root 'matelpage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
