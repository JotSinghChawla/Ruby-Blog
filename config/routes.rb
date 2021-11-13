Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  # resources :articles do 
  #   collection do
  #     get 'test'
  #   end
  # end
    
  resources :articles do
    resources :comments
    collection do
      get 'test'
    end
  end
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
