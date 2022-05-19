Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :drones, only: %i[index show create]
  end
end
