Rails.application.routes.draw do
  get "select_sports" => "posts#select_sports"
  get "new_content/:kind" => "posts#new" 
  
  get "sports/:kind" => "posts#league"
  get ":kind/:league/posts/:id/show" => "posts#show"
  get "/:kind/:league" => "posts#index"
  
  
  post "/create" => "posts#create" 
   
  root "static_pages#home"
  get "about" => "static_pages#about"
  
  
end
