Rails.application.routes.draw do
  
  
  devise_for :users
  get "new_content" => "posts#new" 
  
  get "sports" => "posts#league"
  get "show" => "posts#show"
  get "index" => "posts#index"
  get "post_edit" => "posts#edit"
  post "create" => "posts#create"
  patch "post" => "posts#update"
   
  root "static_pages#home"
  get "about" => "static_pages#about"
  
  
end
