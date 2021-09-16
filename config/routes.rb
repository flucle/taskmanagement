Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'fix_tasks#index'
  resources :tasks, only: [:new, :create] do
    collection do
      get :complete
    end
  end
  resources :fix_tasks, only: [:index]
end
