Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      omniauth_callbacks: 'omniauth_callbacks'
    }

  root "weight_entries#index"

  resources :weight_entries
end
