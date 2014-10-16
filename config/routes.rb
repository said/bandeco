Rails.application.routes.draw do

  get 'places/index'

  get 'places/show'

  get 'places/new'

  get 'places/create'

  get 'places/edit'

  get 'places/update'

  get 'places/destroy'

  get 'placescategories/index'

  get 'placescategories/show'

  get 'placescategories/new'

  get 'placescategories/create'

  get 'placescategories/edit'

  get 'placescategories/update'

  get 'placescategories/destroy'

  get 'restaurantopeninghours/index'

  get 'restaurantopeninghours/show'

  get 'restaurantopeninghours/new'

  get 'restaurantopeninghours/create'

  get 'restaurantopeninghours/edit'

  get 'restaurantopeninghours/update'

  get 'restaurantopeninghours/destroy'

  get 'menuscomments/index'

  get 'menuscomments/show'

  get 'menuscomments/new'

  get 'menuscomments/create'

  get 'menuscomments/edit'

  get 'menuscomments/update'

  get 'menuscomments/destroy'

  get 'menus/index'

  get 'menus/show'

  get 'menus/new'

  get 'menus/create'

  get 'menus/edit'

  get 'menus/update'

  get 'menus/destroy'

  get 'meals/index'

  get 'meals/show'

  get 'meals/new'

  get 'meals/create'

  get 'meals/edit'

  get 'meals/update'

  get 'meals/destroy'

  get 'restaurants/index'

  get 'restaurants/show'

  get 'restaurants/new'

  get 'restaurants/create'

  get 'restaurants/edit'

  get 'restaurants/update'

  get 'restaurants/destroy'

  get 'campusunits/index'

  get 'campusunits/show'

  get 'campusunits/new'

  get 'campusunits/create'

  get 'campusunits/edit'

  get 'campusunits/update'

  get 'campusunits/destroy'

  get 'wellcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  resources :campusunits, :path => "campus"
  resources :restaurants, :path => "restaurante"
  resources :restaurantopeninghours, :path => "horariosrestaurante"
  resources :meals, :path => "refeicao"
  resources :menus, :path => "cardapio"
  resources :menuscomments, :path => "comentariosrefeicao"
  resources :placescategories, :path => "categoriaslocal"
  resources :places, :path => "local"


  namespace :api, defaults: {format: 'json'}  do
      resources :campusunits, :path => "campus"
      resources :meals, :path => "refeicao"
  end
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
