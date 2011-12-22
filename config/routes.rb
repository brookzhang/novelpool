Novelpool::Application.routes.draw do
  get "pages/category"

  get "pages/contact"

  get "pages/home"

  get "pages/toplist"

  get "pages/about"

  get "pages/help"

  namespace 'maintain' do
    resource :session
    resources :comments,:categories,:users,:books
    resources :books do
      resources :chapters
    end
    
    match '/dashboard',:to=> 'dashboard#show'
    match '/user_info',:to=> 'user_info#show'
    match '/user_info/edit',:to=> 'user_info#edit'
    match '/user_info/update',:to=> 'user_info#update'
    match '/author_info',:to=> 'author_info#show'
    match '/author_info/edit',:to=> 'author_info#edit'
    match '/author_info/update',:to=> 'author_info#update'
    
    root :to => 'dashboard#show'
  end
  

  get "sessions/new"
  
  resources :sessions , :only =>[:new,:create,:destroy]
  resources :microposts,:only=>[:create,:destroy]
  resources :relationships, :only =>[:create , :destroy]
  resources :users,:categories 
  resource :user
  resources :books do
    resources :chapters
  end

  match '/toplist',:to=> 'pages#toplist'
  match '/about',:to=>'pages#about'
  match '/help',:to=>'pages#help'
  match '/signup',:to=>'users#new'
  match '/signin',:to => 'sessions#show'
  match '/signout', :to=>'sessions#destroy'
  
  root :to=>'pages#home'
end
