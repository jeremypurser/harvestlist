Rails.application.routes.draw do
  get 'epicenter/feed'
  get 'epicenter/show_user'
  get 'epicenter/now_following'
  get 'epicenter/unfollow'
  get 'store' => 'wholesale#all_products'
  get 'categories' => 'wholesale#products_by_category'
  get 'vendors' => 'wholesale#products_by_vendor'
  resources :products
  devise_for :users

  root 'wholesale#all_products'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
