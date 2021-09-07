Rails.application.routes.draw do
  devise_for :users

  resources :jobs, shallow: true do
    resources :applications
  end

  root to: 'jobs#index'
end
