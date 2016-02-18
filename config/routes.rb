Rails.application.routes.draw do


   resources :topics do
 # #34
     resources :posts, except: [:index]
   end

   resources :topics do
 # #34
     resources :sponsored_posts, except: [:index]
   end
   
  resources :users, only: [:new, :create]

  
  get 'about' => 'welcome#about'

  root 'welcome#index'
end