Urdb::Application.routes.draw do
  resources :movies do
    resources :showtimes
  end

  root 'movies#index'
end
