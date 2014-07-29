Rails.application.routes.draw do
  resources :users, :contacts, :only => [:create, :destroy, :index, :show, :update]
end
