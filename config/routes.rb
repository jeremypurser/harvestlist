Rails.application.routes.draw do
  get 'cart/add_to_cart'
  get 'cart/view_order'
  get 'cart/checkout'
  get 'feed' => 'epicenter#feed'
  get 'show_user' => 'epicenter#show_user'
  get 'following' => 'epicenter#now_following'
  get 'unfollow' => 'epicenter#unfollow'
  get 'store' => 'wholesale#all_products'
  get 'categories' => 'wholesale#products_by_category'
  get 'vendors' => 'wholesale#products_by_vendor'
  resources :products
  devise_for :users

  root 'epicenter#feed'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
