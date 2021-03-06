Friendlymail::Application.routes.draw do
  
    match '/logout', :to=> "sessions#destroy", :as=> "logout"
	match '/login', :to=> "sessions#new", :as=> "login"
	match '/register', :to=> "users#create", :as=> "register"
	match '/signup', :to=> "users#new", :as=> "signup"
  
	resources :users
  	resource :session
	#resources :messages
	resources :messages do
		put 'complete', :on => :collection
	end
	match "/messages/destroy/:id", :to => "messages#destroy", :as =>"destroy_message"
	root :to => 'home#index'
	
end
