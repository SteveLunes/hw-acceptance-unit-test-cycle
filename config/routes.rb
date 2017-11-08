Rottenpotatoes::Application.routes.draw do
  root 'movies#index'
  resources :movies
  get '/movies/:id/similar' => 'movies#similar', :as => :similar

end