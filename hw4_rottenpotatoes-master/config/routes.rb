Rottenpotatoes::Application.routes.draw do
  resources :movies
  
   match 'movies/:id/same_director' => 'movies#same_director', :as => :same_director, :via => [:get]
   
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
