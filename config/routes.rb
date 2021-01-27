Rails.application.routes.draw do
  root to: 'public/homes#top'
  get '/support' => 'public/homes#support'
  get '/link' => 'public/homes#link'

  scope module: :public do
    resources :blogs do
      resources :blog_comments, only: [:create, :destroy]
    end
    get '/users/my_page' => 'users#my_page'
    patch '/users' => 'users#update'
    get '/users/my_page/edit' => 'users#edit'
    
    devise_for :users, controllers: {
      sessions: 'public/users/sessions',
      registrations: 'public/users/registrations',
      passwords: 'public/users/passwords'
    }
  end
  
  scope module: :admin do
    devise_for :admin, controllers: {
      sessions: 'admin/admins/sessions',
      passwords: 'admin/admins/passwords',
      registrations: 'admin/admins/registrations'
    }
  end
  
  namespace :admin do
    resources :blogs
    resources :genres
    resources :users, only: [:index, :show, :edit, :update]
  end
  
end
