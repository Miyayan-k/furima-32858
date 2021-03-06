Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :purchases, only: [:index, :create]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end

  # ログアウト実行時に「No route matches [GET] "/users/sign_out"」エラーが発生するため
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end