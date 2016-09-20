Rails.application.routes.draw do
  # match "/:controller(/:action(/:id))", :via => [:get, :post]
  get 'home/index'
  get 'home/upload_pet'
  get 'list' => 'home#list'
  get 'matching_view' => 'home#matching_view'
  get 'pet_content/:id' => 'home#pet_content'
  post 'pet_upload' => 'home#pet_upload'
  get 'home/about'
  get 'home/question' => 'home#question'
  get 'question_rewrite/:id' => 'home#question_rewrite'
  get 'destroy/:id' => 'home#question_destroy'
  get 'pet_upload/about.html' => 'home#about'
  get 'home/question_write(/:id)' => 'home#question_write'
  post 'home/write_question'
  post 'home/form'
  post 'home/writenewdogreply' => 'home#writenewdogreply'
  get 'matching' => 'home#matching'
  get 'delete_pet/:id' => 'home#delete_pet'
  get 'delete_reply/:id' => 'home#delete_reply'
  devise_for :users, controllers: {:registrations => "users/registrations", :sessions => "users/sessions" }
  get 'home/my_pages'
  get 'home/infomation'
  get 'home/upload_pet'
  get 'home/message_recieved_box'
  get 'about.html' => 'home#about'
  get 'users/about.html' => 'home#about'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
 
  get 'home/questions(/:id)' => 'home#show_questions'
  #메시지 관련 라우트
  get 'home/message_recieved_box'
  get 'show(/:id)' => 'home#message_show'
  
  get 'new(/:id)' => 'home#message_new'
  get 'show_content(/:id)' => 'home#show_content'
  post 'home/message_create'
  post 'home/question'
  resources :home
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
  
  
  #로그인 관련 route
  get '/users/index.html' => 'home#index'
end
