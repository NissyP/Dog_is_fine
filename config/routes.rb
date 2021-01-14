Rails.application.routes.draw do
  root to: 'homes#top'
  get '/support' => 'public/homes#support'
  get '/link' => 'public/homes#link'

  scope module: :public do
  end
end
