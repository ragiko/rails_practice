BookAdmin::Application.routes.draw do
  get "profile/show"
  get "profile/edit"
  get "profile/update"
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

  # asはbooks_pathを通すため
  get 'books/show/:id' => 'books#show', as: :books
  get 'books/hide/:id' => 'books#show_hide'
  get 'books/slim/' => 'books#slim'

  resources :publishers
  resources :publishers do
    resources :books
    
    # publisherの個別のリソースに対してアクションを指定
    member do
      get 'detail'
    end
    
    # publisherの全体のリソースに対してアクションを指定
    collection do
      get 'search'
    end
  end

  # 単数系
  # 一覧のindexが作られない
  # :idによる絞り込みが無い
  # %i{a b} to [:a, :b]
  resource :profile, only: %i{show edit update}
end
