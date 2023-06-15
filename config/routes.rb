Rails.application.routes.draw do

  #トップ画面に設定
  root to: 'homes#top'

  #ルーティングを一括して自動生成してくれる機能
  resources :books

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
