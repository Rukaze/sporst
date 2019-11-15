Rails.application.routes.draw do
   
  get "new_content" => "posts#new" 
  get "sports/:kind" => "posts#league"
  get ":kind/:league/posts/:id/show" => "posts#show"
  get "/:kind/:league" => "posts#index"
  
  post "/create" => "posts#create" 
   
  root "static_pages#home"
  get "about" => "static_pages#about"
  
  
end
