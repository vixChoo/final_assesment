Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'search#index'
	
	resources :users

	get 'search' => 'search#show' , :as => "search"
	
	get 'users/profile' => 'users#show' , :as => "user_profile"
	patch '/users/profile/edit' => 'users#edit' , :as => "user_edit"

	# omniauth login
	get "/auth/:provider/callback" => "sessions#create_from_omniauth"
	
	# log in page with form:
	get '/login'     => 'sessions#new'
	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'
	# delete action to log out:
	delete '/logout' => 'sessions#destroy'    
	
	
	
	
  
	
  
end
