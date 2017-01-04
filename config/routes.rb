Rails.application.routes.draw do
  get 'galleries/index'

  #get 'shop/index'

  devise_for :users
  resources :budgets
  resources :products 
  resources :categories
  resources :galleries
  resources :shop do
  	member do
  		post "add"
      post "restar"
      post "suma"
      post "deletedetalle"
      get "pdf"
      
  	end
      collection do
        get  "showallbudget"
      end 

  end
  root 'shop#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
