Zleep::Application.routes.draw do




  get "twilio/message"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get "welcome/mesage"
  get "alarms/sleep"
  get "alarms/help" 
  get "musics/index"
  get "alarms/sleep101"
  get "users/stats"
  get "/users/profile/:id" => "users#profile", :as => :public_profile
  post 'welcome/contact' => 'welcome#contact', :as => :welcome_contact
  get "welcome/calling" => "welcome#calling", :as => :welcome_calling
  get "welcome/texting" => "welcome#texting", :as => :welcome_texting
  get "welcome/demo"
  get "twilio/scheduler"






  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   




  
  authenticated :user do
    root :to => "welcome#home", as: :welcome_home
  end

   root :to => 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  resources :users
  
  resources :alarms do
    collection do 
      get :sleep
    end

    member do
      put :toggle
    end
  end
  resources :reminders
  resources :days
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
end
