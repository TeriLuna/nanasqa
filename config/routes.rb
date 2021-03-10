Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root "home#index"

  get '/:locale' => 'home#index'

  scope "(:locale)", locale: /en|es/ do
    resource :languages, only: [:update]
    resources :volunteers, only: [:index]
    resources :reservations
    resources :users, only: [:index] do
      collection do
        patch 'update_password'
      end
    end
  end

end
