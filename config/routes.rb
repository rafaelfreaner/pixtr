require "monban/constraints/signed_in"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end
  root to: "homes#show" #THIS IS TO REDIRECT THE ROOT TO THE GALLERIES PAGE
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resource :dashboard, only: [:show]
  resources :groups do
    member do
      post "join" => "group_memberships#create"
      delete "leave" => "group_memberships#destroy"
    end
  end
  resources :galleries do
    resources :images do#THIS DO STATEMENT IS FOR NESTED RESOURCES, BECAUSE WE WANT IMAGES INSIDE GALLERIES. /GALLERIES/IMAGES/ID
      resources :comments
      resources :tags, only: [:show]
      member do
        post "like" => "likes#create"
        delete "unlike" => "likes#destroy"
      end
    end
                      #WE CAN LIMITD THE ROUTES BY DEFINING resources :images, only: [:new]
  end

  #RESOURCES DESCRIBE WHAT WE CAN DO, A FORM OF ORGANIZATION
  # get "/galleries" => "galleries#index"
  # get "/galleries/new" => "galleries#new" #THIS IS THE FORM, PRESENTATION LOGIC
  # get "/galleries/:id" => "galleries#show", as: :gallery #WHENEVER THERE'S A VARIABLE IN THE ROUTE, WE NEED TO SPECIFY WHERE IT GOES TO WITH AS: :GALLERY
  # post "/galleries" => "galleries#create" #THE PERSISTANCE, SAVES IT TO THE DATABASE
  # delete "/galleries/:id" => "galleries#destroy" # THE HTTP VERD IS DELETE BUT THE ACTION IS DESTROY
  # get "/galleries/:id/edit" => "galleries#edit"
  # patch "/galleries/:id" => "galleries#update"
end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end



