Rails.application.routes.draw do
  
  devise_for :users, controllers: {
  confirmations: 'users/confirmations',
  passwords:     'users/passwords',
  registrations: 'users/registrations',
  sessions:      'users/sessions',
  unlock:        'users/unlok',
  omniauth:      'users/omniauth'
}
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
