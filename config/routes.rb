Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  get '/(:locale)' => 'home#index'

  scope "(:locale)", locale: /en|es/ do
    resource :languages, only: [:update]
    resources :volunteers, only: [:index]

  end

end
