Rails.application.routes.draw do
  get 'posts/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'root#top'

  post 'posts' => 'posts#create'

  get 'posts' => 'posts#index'

  get 'posts/:id' => 'posts#show',as: 'post'
  #投稿１件ごとの詳細を表示
  #.../posts/1 や .../posts/3 に該当する

  get 'posts/:id/edit' => 'posts#edit', as: 'edit_post'

  patch 'posts/:id' => 'posts#update', as: 'update_post'

  #3-9
  delete 'posts/:id' => 'post#destoroy', as: 'destoroy_post'
end
