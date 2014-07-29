Rails.application.routes.draw do
  resources :users, :contacts, :only => [:create, :destroy, :index, :show, :update]
  resources :contact_shares, :only => [:create, :destroy]

  resources :users do
    resources :contacts, :only => :index
  end
end
