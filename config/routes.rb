Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/edit'
  get 'comments/show'
  root 'departments#index'
  resources :departments do
    resources :items
  end
end
