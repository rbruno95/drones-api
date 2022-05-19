Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :drones, only: %i[index show create] do
      resources :medications, only: %i[index create]
    end
  end
end
