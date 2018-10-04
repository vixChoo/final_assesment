Rails.application.routes.draw do
  resources :testings
 	 get 'test' => 'testings#test' , :as => "test"
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'job#index'

	get 'job/show'
	
	get 'search/index'
	get 'search' => 'search#show' , :as => "search"
	
	resources :users
	get 'users/profile' => 'users#show' , :as => "user_profile"
	patch '/users/profile/edit' => 'users#edit' , :as => "user_edit"
	
	# omniauth login
	get "/auth/:provider/callback" => "sessions#create_from_omniauth"
	
	# session
	# get request is return data from server / display 
	#  post update/create data to server / insert new data (user)

	# log in page with form:
	get '/login'     => 'sessions#new'
	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'
	# delete action to log out:
	delete '/logout' => 'sessions#destroy'    
	
	
	
	
  
	
  
end
