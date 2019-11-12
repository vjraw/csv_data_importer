Rails.application.routes.draw do
  root to: "people#index"

  resources :people do
    collection {post :import}
  end
end
