Rusrails::Application.routes.draw do

  get "sessions/new"

  root :to => "welcome#index"


   #get "rooms/index"

   get "rooms/:id/edit" => "posts#edit"
   put "rooms/:id" => "posts#update"
   get "rooms/new"
   get "rooms/show"
   get "rooms" => "rooms#index"
   post "rooms/create"
   get "rooms/:id" => "rooms#show"
   delete "rooms/:id" => "rooms#destroy"


  get "welcome/index"
  get "welcome/about"


  get "posts/:id/edit" => "posts#edit"
  put "posts/:id" => "posts#update"
  get "posts/new"
  get "posts/show"
  get "posts" => "posts#index"
  post "posts/create"
  get "posts/:id" => "posts#show"
  delete "posts/:id" => "posts#destroy"

  get "users/:id/edit" => "users#edit"
   put "users/:id" => "users#update"
   get "users/new"
   get "users/show"
   get "users" => "users#index"
   post "users/create"
   get "users/:id" => "users#show"
   delete "users/:id" => "users#destroy"


  resources :users

    resources :sessions, :only => [:new, :create, :destroy]

    match '/signup',  :to => 'users#new'
    match '/signin',  :to => 'sessions#new'
    match '/signout', :to => 'sessions#destroy'


  resources :posts do
    resources :comments
  end

  get "cities/Lvov"
  get "cities/Karpaty"
  get "cities/Kiev"
  get "cities/Odessa"
  get "cities/Krim"
  get "cities/Donetsk"
  get "cities/Harkov"
  get "cities/Yalta"
  get "cities/Alushta"



  #Это создаст comments как вложенный ресурс в posts.
  #Это другая сторона захвата иерархических отношений, существующих между публикациями и комментариями.



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
