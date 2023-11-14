Rails.application.routes.draw do
  resources :tasks do
    member do
      post :complete
      post :uncomplete
    end
  end
end
