Rails.application.routes.draw do
  post 'add_to_cart' => 'cart#add_to_cart'
  get 'view_order' => 'cart#view_order'
  get 'checkout' => 'cart#checkout'
  get 'feed' => 'epicenter#feed'
  get 'show_user' => 'epicenter#show_user'
  get 'following' => 'epicenter#now_following'
  get 'unfollow' => 'epicenter#unfollow'
  get 'store' => 'wholesale#all_products'
  get 'categories' => 'wholesale#products_by_category'
  get 'vendors' => 'wholesale#products_by_vendor'
  delete 'remove' => 'cart#remove'

  resources :products
  devise_for :users, controllers: { registrations: "registrations" }

  root 'epicenter#feed'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
