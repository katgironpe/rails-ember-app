Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root to: 'home#index'
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1) do
      resources :leads
    end
  end
  get '*path', to: 'home#index'
end
