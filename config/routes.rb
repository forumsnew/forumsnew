ActionController::Routing::Routes.draw do |map|
  map.resources :posts

  map.resources :settings

  map.resources :categories

  map.resources :coupons

  map.resources :users

  map.resources :products

  map.resources :orders
  
  map.resources :orders, :new => { :express => :get }
  
  map.resources :jobs
  
  map.connect '/jobs/posts/:id/new', :controller => 'jobs', :action => 'new_post'
  
  map.connect '/admin/settings/coupons', :controller => 'admin/settings', :action => 'coupons'
  map.connect '/admin/settings/coupons/new', :controller => 'admin/settings', :action => 'new_coupons'
  
  map.connect '/admin/settings/products', :controller => 'admin/settings', :action => 'products'
  map.connect '/admin/settings/products/new', :controller => 'admin/settings', :action => 'new_products'

  
  
  map.connect 'signup', :controller => 'users', :action => 'new'
  map.connect 'login', :controller => 'session', :action => 'login'
  map.connect 'logout', :controller => 'session', :action => 'logout'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
     map.namespace :admin do |admin|
       # Directs /admin/orders/* to Admin::ProductsController (app/controllers/admin/orders_controller.rb)
       admin.resources :orders, :has_one => :transactions
       admin.resources :transactions
       admin.resources :categories
       admin.resources :products
       admin.resources :index
       admin.resources :clients
       admin.resources :settings
       
     end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
   map.root :controller => "index"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
