Rails.application.routes.draw do
  get 'actors/search', to: 'actors#search', as: 'actors_search'  
  resources :movies, only: [:index]
end
