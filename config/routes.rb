Rails.application.routes.draw do
   
  get "new_content" => "posts#new" 
  get 'basketball' => "posts#basketball"
  get "baseball" => "posts#baseball"
  get "baseball/:id/show" => "posts#show"
  get "basketball/:id/show" => "posts#show"
  post "/create" => "posts#create" 
   
  root "static_pages#home"
  get "about" => "static_pages#about"
  
  
end
