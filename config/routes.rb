Rails.application.routes.draw do
   
  get 'basketball' => "posts#basketball"

  get "baseball" => "posts#baseball"

  root "static_pages#home"
  get "about" => "static_pages#about"
  
  
end
