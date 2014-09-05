Rails.application.routes.draw do
  root to: 'home#index'
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      resources :leads
    end
  end
  get '*path', to: 'home#index'
end
