Himignu::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  resources :informations, :only => [:index, :show]
  resources :events, :only => [:show]
  resources :galleries, :only => [:index, :show]
  get "about_us" => "about_us#index", :as => "about_us"
  get "ppit" => "ppit#index", :as => "ppit"
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  resources :sessions, :only => [:create]

  get "admin" => "admin/dashboard#index", :as => "admin"

  namespace :admin do
    resources :galleries do
      resources :gallery_images, :only => [:create, :edit, :update, :destroy] do
        member do
          get 'set_primary'
        end
      end
    end
    resources :informations, :only => [:index, :edit, :update, :new, :create, :destroy]
    resources :events do
      member do
        get 'set_popular_event'
      end
      resources :event_images, :only => [:create, :edit, :update, :destroy]
      resources :archive, :only => [:new, :create, :edit, :update, :destroy, :show]
    end
    resources :banners, :only => [:edit, :update, :new, :create, :destroy]
    resources :members, :only => [:index, :edit, :update, :new, :create, :destroy]
  end

  root :to => 'home#index'
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