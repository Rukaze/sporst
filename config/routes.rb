Rails.application.routes.draw do
   
  root "static_pages#home"
  get "about" => "static_pages#about"
  get "baseball" => "static_pages#baseball"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
  
  
end
