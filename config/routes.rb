Rails.application.routes.draw do
  # Devise routes with custom logout route
  devise_for :users

  # Custom static route for destroying session/signout (using GET method)
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy' # Custom logout route with GET method
  end

  # Custom static route for destroying articles (using GET method)
  get 'articles/:id/destroy', to: 'articles#destroy', as: :destroy_article

   # Custom static route for deleting a comment using GET method
   get 'articles/:article_id/comments/:id/destroy', to: 'comments#destroy', as: :destroy_comment

  # Root path
  root "articles#index"

  resources :users, only: [:index, :edit, :update]


  # Nested resources for articles and comments
  resources :articles do
    resources :comments
  end
end
