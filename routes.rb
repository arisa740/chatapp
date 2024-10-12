Rails.application.routes.draw do
  resources :tasks, only: [:index, :create] do
    member do
      patch :complete
    end
  end

  root 'tasks#index'
end
