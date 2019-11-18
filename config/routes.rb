Rails.application.routes.draw do
  
  get "new_content" => "posts#new" 
  
  get "sports" => "posts#league"
  get "show" => "posts#show"
  get "index" => "posts#index"
  
  
  post "create" => "posts#create" 
   
  root "static_pages#home"
  get "about" => "static_pages#about"
  
  
end
