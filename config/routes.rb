Rails.application.routes.draw do
   
  get "new_content" => "posts#new" 
  get "sports/:kind" => "posts#league"
  get "sports/posts/:id/show" => "posts#show"
  
  post "/create" => "posts#create" 
   
  root "static_pages#home"
  get "about" => "static_pages#about"
  
  
end
