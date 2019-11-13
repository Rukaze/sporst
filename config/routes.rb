Rails.application.routes.draw do
   
  get 'basketball' => "posts#basketball"
  
  get "baseball" => "posts#baseball"
  get "baseball/:id/show" => "posts#show"

  root "static_pages#home"
  get "about" => "static_pages#about"
  
  
end
