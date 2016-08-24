Rails.application.routes.draw do

  get 'home/index'
  get 'home/upload_pet'
  get 'list' => 'home#list'
  post 'home/pet_upload' => 'home#pet_upload'
  get 'home/about'
  get 'home/contact'
  post 'home/form'
  get 'home/matching'
  devise_for :users, controllers: {:registrations => "users/registrations", :sessions => "users/sessions" }
  get 'home/my_pages'
  get 'home/infomation'
  get 'home/upload_pet'
  get 'home/message_recieved_box'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
 root 'home#index'
 
  #메시지 관련 라우트
  get 'home/message_recieved_box'
  get 'show(/:id)' => 'home#message_show'
  
  get 'new(/:id)' => 'home#message_new'
  get 'show_content(/:id)' => 'home#show_content'
  post 'home/message_create'

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
end
